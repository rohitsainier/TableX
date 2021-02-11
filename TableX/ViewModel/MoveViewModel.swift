//
//  MoveViewModel.swift
//  TableX
//
//  Created by Rohit Saini on 10/02/21.
//

import Foundation


class MoveViewModel{
    //left tableview Data
     var leftScoreArr: [Score] = [Score(name: "A", score: 0, isSelected: false),Score(name: "B", score: 0, isSelected: false),Score(name: "C", score: 0, isSelected: false),Score(name: "D", score: 0, isSelected: false),Score(name: "E", score: 0, isSelected: false),Score(name: "F", score: 0, isSelected: false),Score(name: "G", score: 0, isSelected: false),Score(name: "H", score: 0, isSelected: false),Score(name: "I", score: 0, isSelected: false),Score(name: "J", score: 0, isSelected: false)]
     var rightScoreArr = [Score]()
    
    
    func moveRight(){
    let moveArr = leftScoreArr.filter{$0.isSelected == true}
    rightScoreArr.append(contentsOf: moveArr)
    leftScoreArr = leftScoreArr.filter{$0.isSelected != true}
    
    }
    
    func moveLeft(){
        let moveArr = rightScoreArr.filter{$0.isSelected == true}
        leftScoreArr.append(contentsOf: moveArr)
        rightScoreArr = rightScoreArr.filter{$0.isSelected != true}
    }
    
    func selectLeftCell(index: Int){
        if !leftScoreArr[index].isSelected{
            leftScoreArr[index].isSelected = true
        }
        else{
            leftScoreArr[index].isSelected = false
        }
    }
    
    func selectRightCell(index:Int){
        if !rightScoreArr[index].isSelected{
            rightScoreArr[index].isSelected = true
        }
        else{
            rightScoreArr[index].isSelected = false
        }
    }
    
    func leftIncrease(index:Int){
        self.leftScoreArr[index].score += 1
    }
    
    func leftDecrease(index:Int){
        if self.leftScoreArr[index].score > 0{
            self.leftScoreArr[index].score -= 1
        }
    }
    func rightIncrease(index:Int){
        self.rightScoreArr[index].score += 1
    }
    
    func rightDecrease(index:Int){
        if self.rightScoreArr[index].score > 0{
            self.rightScoreArr[index].score -= 1
        }
    }
    
    
}
