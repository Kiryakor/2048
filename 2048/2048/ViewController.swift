//
//  ViewController.swift
//  2048
//
//  Created by кирилл корнющенков on 19.01.2020.
//  Copyright © 2020 кирилл корнющенков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: GameCV!
    @IBOutlet weak var newGameButton: Button!
    var animateIndex:Int = -1
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewFuncForViewDidLoad()
        NotificationCenter.default.addObserver(self,selector: #selector(sceneWillResignActiveNotification(_:)),name: UIApplication.willResignActiveNotification,object: nil)
    }
    
    //MARK: newGame
    @IBAction func tapTryArain(_ sender: UIButton){
        newGame()
    }
}

//MARK: CollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionViewFuncForViewDidLoad(){
        collectionView.startArray()
        collectionViewProtocol(collectionView: collectionView)
        swipeAdd()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.collectionView.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.cellSetting(cell: cell)
        cell.cellContent(cell: cell, data: self.collectionView.data[indexPath.row])
        if indexPath.row == animateIndex{
            cell.animateNewElement()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = (collectionView.frame.width - 25) / 4
        return CGSize(width: size, height: size)
    }
    
    func swipeAdd(){
        let left = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes(_:)))
        right.direction = .right
        let up = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes(_:)))
        up.direction = .up
        let down = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes(_:)))
        down.direction = .down
        
        collectionView.addGestureRecognizer(left)
        collectionView.addGestureRecognizer(right)
        collectionView.addGestureRecognizer(up)
        collectionView.addGestureRecognizer(down)
    }
    
    //все действия
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer){
        var swipeCount = 0
        switch sender.direction {
        case .right:
            swipeCount = collectionView.right()
        case .left:
            swipeCount = collectionView.left()
        case .down:
            swipeCount = collectionView.down()
        case .up:
            swipeCount = collectionView.up()
        default:
            print("error swipe")
        }
        if collectionView.checkWin(){
              alertWin()
        }else{
            if collectionView.checkFinishGame() && swipeCount>0{
                collectionView.genNewElement { (index) in
                    self.animateIndex = index
                }
            }
            if !collectionView.checkFinishGame() && !collectionView.continion(){
                newGameButton.isHidden = false
            }
        }
        if swipeCount>0{
            collectionView.reloadData()
        }
    }
    
    //CollectionView portocol
    func collectionViewProtocol(collectionView:UICollectionView){
           collectionView.delegate = self
           collectionView.dataSource = self
    }
}

//MARK: element satting
extension ViewController{
    
    //win alert
    func alertWin(){
        let alert = UIAlertController(title: "You WIN", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { [weak self](action) in
            self?.newGame()
        }
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }
    
    //new game
    func newGame(){
        collectionView.data.removeAll()
        newGameButton.isHidden = true
        for _ in 1...16{
            collectionView.data.append(cellData())
        }
        collectionView.genNewElement { _ in }
        collectionView.reloadData()
    }
    
    @objc func sceneWillResignActiveNotification(_ notification: NSNotification) {
        collectionView.returnData { (data) in
            var dataDigite:[Int] = []
            for i in data{
                if i.digite==nil{
                    dataDigite.append(-1)
                }else{
                    dataDigite.append(i.digite!)
                }
            }
            let defaults = UserDefaults.standard
            defaults.set(dataDigite, forKey: "data")
        }
    }
}
