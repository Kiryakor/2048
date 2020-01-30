//
//  check.swift
//  2048
//
//  Created by кирилл корнющенков on 19.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import Foundation

//проверка крайних ячеек
struct checkExtremeStruct {
    let main:Int
    let support1:Int
    let support2:Int
}

//проверка боковых ячеек
struct checkSideStruct {
    let main:Int
    let support1:Int
    let support2:Int
    let support3:Int
}

//проверка центральных ячеек
struct checkCenterStruct {
    let main:Int
    let support1:Int
    let support2:Int
    let support3:Int
    let support4:Int
}
