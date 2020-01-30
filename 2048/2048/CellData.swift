//
//  CellData.swift
//  2048
//
//  Created by кирилл корнющенков on 19.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import UIKit

struct cellData {
    let color: UIColor
    let digite: Int?
    let digiteColor: UIColor?
    let data:Bool
    
    init(digite:Int){
        self.color = colorStatic().color(digite: digite)
        self.digite = digite
        digite > 32 ? (self.digiteColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) : (self.digiteColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        self.data = true
    }
    
    init() {
        self.color = #colorLiteral(red: 0.7271783352, green: 0.7574660778, blue: 0.800142169, alpha: 1)
        self.digite = nil
        self.digiteColor = nil
        self.data = false
    }
}
