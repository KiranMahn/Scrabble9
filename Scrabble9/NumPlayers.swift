//
//  ViewController.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 21/12/2022.
//

import UIKit



class NumPlayers: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var numPlayersField: UITextField!
    
    @IBOutlet weak var NumPlayersLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numPlayersField.returnKeyType = .done
        numPlayersField.autocapitalizationType = .words
        numPlayersField.autocorrectionType = .no
        numPlayersField.becomeFirstResponder()
        numPlayersField.delegate = self
        
    }
    
    @IBAction func numPlayersFieldAc(_ sender: Any) {
        numPlayersField.resignFirstResponder()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        let text = textField.text
        numPlayers = Int(text ?? "0") ?? 0
        sk.initializeScores()
        print("\(text)")
        print("\(numPlayers)")
        
        return true
    }
   
    public func getNumPlayers() -> Int {
        //print("\(numPlayers)")
        return numPlayers
    }
    
    
    

}



