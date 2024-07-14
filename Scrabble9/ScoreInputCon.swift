//
//  ViewController.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 21/12/2022.
//

import UIKit

class ScoreInputCon: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var avatar1: UIImageView!
    @IBOutlet weak var score1: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var avatar2: UIImageView!
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var avatar3: UIImageView!
    @IBOutlet weak var score3: UILabel!
    
    @IBOutlet weak var name4: UILabel!
    @IBOutlet weak var avatar4: UIImageView!
    @IBOutlet weak var score4: UILabel!
    
    @IBOutlet weak var enterScoreLab: UILabel!
    
    @IBOutlet weak var scoreField: UITextField!
    
    @IBOutlet weak var endButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("p3")
        scoreField.returnKeyType = .done
        scoreField.autocapitalizationType = .words
        scoreField.autocorrectionType = .no
        scoreField.becomeFirstResponder()
        scoreField.delegate = self
        enterScoreLab.text = "Enter \(sk.getName())'s score"
        if numPlayers == 2 {
            name1.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name2.text = sk.getName()
            sk.resetCurrentPlayerIndex()
            
            avatar1.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar2.image = sk.getAvatar()
            sk.resetCurrentPlayerIndex()

            score1.text = "0"
            score2.text = "0"
            
            name3.isHidden = true
            score3.isHidden = true
            name4.isHidden = true
            score4.isHidden = true
        }
        else if numPlayers == 3 {
            name1.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name2.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name3.text = sk.getName()
            sk.resetCurrentPlayerIndex()
            
            avatar1.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar2.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar3.image = sk.getAvatar()
            sk.resetCurrentPlayerIndex()

            score1.text = "0"
            score2.text = "0"
            score3.text = "0"
            
            name4.isHidden = true
            score4.isHidden = true
        }
        else if numPlayers == 4 {
            name1.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name2.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name3.text = sk.getName()
            sk.increaseCurrentPlayerIndex()
            name4.text = sk.getName()
            sk.resetCurrentPlayerIndex()
            
            avatar1.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar2.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar3.image = sk.getAvatar()
            sk.increaseCurrentPlayerIndex()
            avatar4.image = sk.getAvatar()
            sk.resetCurrentPlayerIndex()

            score1.text = "0"
            score2.text = "0"
            score3.text = "0"
            score4.text = "0"
        }
        
        
    }
    
    @IBAction func scoreFieldAc(_ sender: Any) {
        
        
    }
    
    @IBAction func endButtonAc(_ sender: Any) {
        scoreField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let cScore = Int(scoreField.text ?? "0") ?? 0
        sk.addScore(score: cScore)
        updateScoreLabel(score: cScore)
        if sk.getCurrentPlayerIndex() < (numPlayers - 1) {
            sk.increaseCurrentPlayerIndex()
        }
        else {
            sk.resetCurrentPlayerIndex()
        }
        scoreField.text = ""
        enterScoreLab.text = "Enter \(sk.getName())'s score"
        return true
    }
    
    func updateScoreLabel(score: Int) {
        print("score: \(score)")
       
        if(sk.getCurrentPlayerIndex() == 0) {
            score1.text = String(sk.getScore())
            print("score1 text: \(score1.text)")
        }
        if(sk.getCurrentPlayerIndex() == 1) {
            score2.text = String(sk.getScore())
        }
        if(sk.getCurrentPlayerIndex() == 2) {
            score3.text = String(sk.getScore())
        }
        if(sk.getCurrentPlayerIndex() == 3) {
            score4.text = String(sk.getScore())
        }
    }
}



