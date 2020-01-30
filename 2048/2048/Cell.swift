//
//  Cell.swift
//  2048
//
//  Created by кирилл корнющенков on 19.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.textAlignment = .center
        label.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    func cellSetting(cell:UICollectionViewCell){
        cell.layer.cornerRadius = cell.frame.height / 8
        cell.clipsToBounds = true
        cell.backgroundColor = .white
    }
    
    func cellContent(cell:Cell,data:cellData){
        if data.digite != nil{
            cell.backgroundColor = data.color
            cell.label.text = String(data.digite!)
            cell.label.textColor = data.digiteColor
        }else{
            cell.backgroundColor = data.color
            cell.label.text = ""
        }
    }
    
    func animateNewElement(){
        let bounds = self.bounds
        self.bounds = CGRect(x: self.center.x, y: self.center.y, width: 0, height: 0)
        let text = label.text
        label.text = ""
        UICollectionViewCell.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.bounds = bounds
        }, completion: { [weak self] _ in
            self?.label.text = text
        })
    }
}
