//
//  ScoreKeeper.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 23/12/2022.
//

import UIKit

var numPlayers = 0
var sk = ScoreKeeper()


class ScoreKeeper {
    
    var names: [String] = []
    var scores: [Int] = []
    var avatars: [UIImage] = []
    var currentPlayerIndex = 0
    
    
    
    func addName(name: String) {
        names.append(name)
        
        //print all names
        //for name in names {print(name)}
        
        //print current name
        //print("get current name: \(getName())")
    }
    
    func addScore(score: Int) {
        scores[currentPlayerIndex] += score
    }
    
    func addAvatar(image: UIImage) {
        avatars[currentPlayerIndex] = image
    }
    
    func getName() -> String {
        print("cpi: \(sk.getCurrentPlayerIndex())")
        print("length of names: \(names.count)")
        return names[currentPlayerIndex]
    }
    
    func getScore() -> Int {
        return scores[currentPlayerIndex]
    }
    
    func getAvatar() -> UIImage {
        return avatars[currentPlayerIndex]
    }
    
    func getCurrentPlayerIndex() -> Int {
        return currentPlayerIndex
    }
    
    func increaseCurrentPlayerIndex() {
        currentPlayerIndex = currentPlayerIndex + 1
    }
    
    func resetCurrentPlayerIndex() {
        currentPlayerIndex = 0
    }
    
    func initializeScores() {
        scores = Array(repeating: 0, count: numPlayers)
    }
    
    func initializeAvatar() {
        avatars = Array(repeating: jellyfish!, count: numPlayers)
    }
    
    func getWinner() -> String {
        var maxScore = 0
        var currentWinner = names[0]
        for i in 0...(numPlayers - 1) {
            if(scores[i] > maxScore) {
                maxScore = scores[i]
                currentWinner = names[i]
            }
            
        }
        return currentWinner
    
    }
}

