//
//  GameCV.swift
//  2048
//
//  Created by кирилл корнющенков on 21.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//
import UIKit

class GameCV: UICollectionView {
    var data:[cellData] = []
    
    func returnData(data:@escaping([cellData])->Void){
        data(self.data)
    }
}

//MARK: Проверка
extension GameCV{
    //проверка на наличие пустых ячеек
    func checkFinishGame()->Bool{
        for i in data{
            if !i.data{
                return true
            }
        }
        return false
    }
       
    //win
    func checkWin() ->Bool{
        for i in data{
            if i.digite == 2048{
                return true
            }
        }
        return false
    }
    
    //проверка на наличие одинаковых соседей
    func continion()->Bool{
        var check = false
        let checkExtremeArray:[checkExtremeStruct] = [checkExtremeStruct(main: 0, support1: 1, support2: 4),
                                                      checkExtremeStruct(main: 3, support1: 2, support2: 7),
                                                      checkExtremeStruct(main: 12, support1: 13, support2: 8),
                                                      checkExtremeStruct(main: 15, support1: 14, support2: 11)]
        for i in 0...3{
            if check{
                break
            }
            check = checkExtreme(main: checkExtremeArray[i].main,
                                 support1: checkExtremeArray[i].support1,
                                 support2: checkExtremeArray[i].support2)
        }
        
        let checkSideArray:[checkSideStruct] = [checkSideStruct(main: 1, support1: 0, support2: 2, support3: 5),
                                                checkSideStruct(main: 2, support1: 1, support2: 3, support3: 6),
                                                checkSideStruct(main: 4, support1: 0, support2: 5, support3: 8),
                                                checkSideStruct(main: 8, support1: 4, support2: 9, support3: 12),
                                                checkSideStruct(main: 13, support1: 14, support2: 12, support3: 9),
                                                checkSideStruct(main: 14, support1: 13, support2: 15, support3: 10),
                                                checkSideStruct(main: 7, support1: 3, support2: 11, support3: 6),
                                                checkSideStruct(main: 11, support1: 7, support2: 15, support3: 10)]
        for i in 0...7{
            if check{
                break
            }
            check = checkSide(main: checkSideArray[i].main,
                              support1: checkSideArray[i].support1,
                              support2: checkSideArray[i].support2,
                              support3: checkSideArray[i].support3)
        }


        let checkCenterArray:[checkCenterStruct] = [checkCenterStruct(main: 5, support1: 1, support2: 4, support3: 6, support4: 9),
                                                    checkCenterStruct(main: 6, support1: 5, support2: 7, support3: 2, support4: 10),
                                                    checkCenterStruct(main: 9, support1: 5, support2: 8, support3: 10, support4: 13),
                                                    checkCenterStruct(main: 10, support1: 9, support2: 11, support3: 6, support4: 14)]
        for i in 0...3{
            if check{
                break
            }
            check = checkCenter(main: checkCenterArray[i].main,
                                support1: checkCenterArray[i].support1,
                                support2: checkCenterArray[i].support2,
                                support3: checkCenterArray[i].support3,
                                support4: checkCenterArray[i].support4)
        }
        return check
    }
    
    //проверяем крайние числа на равенство с их соседями
    func checkExtreme(main:Int,support1:Int,support2:Int) -> Bool{
        if (data[main].digite == data[support1].digite || data[main].digite == data[support2].digite){
            return true
        }
        return false
    }
    
    //проверяем боковые числа на равенство с их соседями
    func checkSide(main:Int,support1:Int,support2:Int,support3:Int) -> Bool {
        if data[main].digite == data[support1].digite || data[main].digite == data[support2].digite
            || data[main].digite == data[support3].digite {
            return true
        }
        return false
    }
    
    //проверяем центральные числа на равенство с их соседями
    func checkCenter(main:Int,support1:Int,support2:Int,support3:Int,support4:Int) -> Bool {
        if data[main].digite == data[support1].digite || data[main].digite == data[support2].digite
            || data[main].digite == data[support3].digite || data[main].digite == data[support4].digite{
            return true
        }
        return false
    }
}

//MARK: Ход
extension GameCV{
    func up()->Int{
        var swipe = 0
        swipe += UpOrLeftSwipe(minIndex: 0, maxIndex: 12, kef: 4)
        swipe += leftAndUpSum(one: 0, two: 4, tree: 8, four: 12)
        swipe += UpOrLeftSwipe(minIndex: 1, maxIndex: 13, kef: 4)
        swipe += leftAndUpSum(one: 1, two: 5, tree: 9, four: 13)
        swipe += UpOrLeftSwipe(minIndex: 2, maxIndex: 14, kef: 4)
        swipe += leftAndUpSum(one: 2, two: 6, tree: 10, four: 14)
        swipe += UpOrLeftSwipe(minIndex: 3, maxIndex: 15, kef: 4)
        swipe += leftAndUpSum(one: 3, two: 7, tree: 11, four: 15)
        return swipe
    }
    
    func down()->Int{
        var swipe = 0
        swipe += downOrRigthSwipe(minIndex: 0, maxIndex: 12, kef: 4)
        swipe += rigthAndDownSum(one: 0, two: 4, tree: 8, four: 12)
        swipe += downOrRigthSwipe(minIndex: 1, maxIndex: 13, kef: 4)
        swipe += rigthAndDownSum(one: 1, two: 5, tree: 9, four: 13)
        swipe += downOrRigthSwipe(minIndex: 2, maxIndex: 14, kef: 4)
        swipe += rigthAndDownSum(one: 2, two: 6, tree: 10, four: 14)
        swipe += downOrRigthSwipe(minIndex: 3, maxIndex: 15, kef:4)
        swipe += rigthAndDownSum(one: 3, two: 7, tree: 11, four: 15)
        return swipe
    }
    
    func left()->Int{
        var swipe = 0
        swipe += UpOrLeftSwipe(minIndex: 0, maxIndex: 3, kef: 1)
        swipe += leftAndUpSum(one: 0, two: 1, tree: 2, four: 3)
        swipe += UpOrLeftSwipe(minIndex: 4, maxIndex: 7, kef: 1)
        swipe += leftAndUpSum(one: 4, two: 5, tree: 6, four: 7)
        swipe += UpOrLeftSwipe(minIndex: 8, maxIndex: 11, kef: 1)
        swipe += leftAndUpSum(one: 8, two: 9, tree: 10, four: 11)
        swipe += UpOrLeftSwipe(minIndex: 12, maxIndex: 15, kef: 1)
        swipe += leftAndUpSum(one: 12, two: 13, tree: 14, four: 15)
        return swipe
    }
    
    func right()->Int{
        var swipe = 0
        swipe += downOrRigthSwipe(minIndex: 0, maxIndex: 3, kef: 1)
        swipe += rigthAndDownSum(one: 0, two: 1, tree: 2, four: 3)
        swipe += downOrRigthSwipe(minIndex: 4, maxIndex: 7, kef: 1)
        swipe += rigthAndDownSum(one: 4, two: 5, tree: 6, four: 7)
        swipe += downOrRigthSwipe(minIndex: 8, maxIndex: 11, kef: 1)
        swipe += rigthAndDownSum(one: 8, two: 9, tree: 10, four: 11)
        swipe += downOrRigthSwipe(minIndex: 12, maxIndex: 15, kef: 1)
        swipe += rigthAndDownSum(one: 12, two: 13, tree: 14, four: 15)
        return swipe
    }
    
    func leftAndUpSum(one:Int,two:Int,tree:Int,four:Int)->Int{
        var swipe = 0
        if data[one].digite == data[two].digite && data[one].digite != nil {
            data[one] = cellData(digite: data[one].digite! * 2)
            data[two] = data[tree]
            data[tree] = data[four]
            data[four] = cellData()
            swipe += 1
        }
        if data[tree].digite == data[two].digite && data[two].digite != nil{
            data[two] = cellData(digite: data[two].digite! * 2)
            data[tree] = data[four]
            data[four] = cellData()
            swipe += 1
        }
        if data[tree].digite == data[four].digite && data[tree].digite != nil{
            data[tree] = cellData(digite: data[tree].digite! * 2)
            data[four] = cellData()
            swipe += 1
        }
        return swipe
    }
    
    func rigthAndDownSum(one:Int,two:Int,tree:Int,four:Int)->Int{
        var swipe = 0
        if data[four].digite == data[tree].digite && data[four].digite != nil {
            data[four] = cellData(digite: data[four].digite! * 2)
            data[tree] = data[two]
            data[two] = data[one]
            data[one] = cellData()
            swipe += 1
        }
        if data[tree].digite == data[two].digite && data[tree].digite != nil{
            data[tree] = cellData(digite: data[tree].digite! * 2)
            data[two] = data[one]
            data[one] = cellData()
            swipe += 1
        }
        if data[two].digite == data[one].digite && data[two].digite != nil{
            data[two] = cellData(digite: data[two].digite! * 2)
            data[one] = cellData()
            swipe += 1
        }
        return swipe
    }
    
    func UpOrLeftSwipe(minIndex:Int,maxIndex:Int,kef:Int)->Int{
        var swipeCount = 0
        var value = minIndex
        var count = 0
        var hado = 0
        while value < maxIndex + 1 {
            if self.data[value].data{
                if hado==1{
                    self.data[value-count] = self.data[value]
                    self.data[value] = cellData()
                    swipeCount += 1
                }
            }else{
                hado = 1
                count += kef
            }
            value += kef
        }
        return swipeCount
    }
    
    func downOrRigthSwipe(minIndex:Int,maxIndex:Int,kef:Int)->Int{
        var swipeCount = 0
        var value = maxIndex
        var count = 0
        var hado = 0
        while value > minIndex - 1 {
            if self.data[value].data{
                if hado==1{
                    self.data[value+count] = self.data[value]
                    self.data[value] = cellData()
                    swipeCount += 1
                }
            }else{
                hado = 1
                count += kef
            }
            value -= kef
        }
        return swipeCount
    }
}

//MARK:Вспомогающие функции
extension GameCV{
    func startArray(){
        let savedArray = UserDefaults.standard.object(forKey: "data") as? [Int?]
        if savedArray?.count == 16 {
            for i in savedArray!{
                if i == -1{
                    data.append(cellData())
                }else{
                    data.append(cellData(digite: i!))
                }
            }
        }else{
            for _ in 1...16{
                data.append(cellData())
            }
            genNewElement { _ in }
        }
    }
    
    func genNewElement(newIndex:@escaping((Int)->Void)){
        let newElement = cellData(digite: 2)
        let check = true
        var index = arc4random() % 16
        while check {
            if !self.data[Int(index)].data{
                data[Int(index)] = newElement
                newIndex(Int(index))
                break
            }
            index = arc4random() % 16
        }
    }
}
