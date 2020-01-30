//
//  Button.swift
//  2048
//
//  Created by кирилл корнющенков on 25.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override func awakeFromNib() {
      super.awakeFromNib()
      view()
    }
    
    func view(){
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = self.frame.height / 4
        self.clipsToBounds = true
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.black.cgColor
        self.isHidden = true
    }
}
