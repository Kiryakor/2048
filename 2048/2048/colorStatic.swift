//
//  colorStatic.swift
//  2048
//
//  Created by кирилл корнющенков on 19.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import UIKit

struct colorStatic {
    let a2 = #colorLiteral(red: 0.9293108582, green: 0.9294700623, blue: 0.9293007255, alpha: 1)
    let a4 = #colorLiteral(red: 0.823451221, green: 0.8234113455, blue: 0.8406392932, alpha: 1)
    let a8 = #colorLiteral(red: 0.5626729131, green: 0.8172994256, blue: 0.9425179362, alpha: 1)
    let a16 = #colorLiteral(red: 0.3183631301, green: 0.6156502962, blue: 0.8762559295, alpha: 1)
    let a32 = #colorLiteral(red: 0.09935102612, green: 0.4532182813, blue: 0.772266984, alpha: 1)
    let a64 = #colorLiteral(red: 0.005977380555, green: 0.3324437141, blue: 0.7106510401, alpha: 1)
    let a128 = #colorLiteral(red: 0.01671738736, green: 0.2286086977, blue: 0.5820831656, alpha: 1)
    let a256 = #colorLiteral(red: 0.08390396088, green: 0.1794761419, blue: 0.3860501349, alpha: 1)
    let a512 = #colorLiteral(red: 0.04141493887, green: 0.1374525428, blue: 0.4242787957, alpha: 1)
    let a1024 = #colorLiteral(red: 0.006856347434, green: 0.06721398979, blue: 0.507160008, alpha: 1)
    let a2048 = #colorLiteral(red: 0.04177325219, green: 0.02215959318, blue: 0.2993516028, alpha: 1)
    
    func color(digite:Int)->UIColor{
        switch digite {
        case 2:
            return a2
        case 4:
            return a4
        case 8:
            return a8
        case 16:
            return a16
        case 32:
            return a32
        case 64:
            return a64
        case 128:
            return a128
        case 256:
            return a256
        case 512:
            return a512
        case 1024:
            return a1024
        case 2048:
            return a2048
        default:
            return .clear
        }
    }
}
