//
//  ViewController.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 21/12/2022.
//

import UIKit

class Names: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterNameLab: UILabel!
    
 
    @IBOutlet weak var nameField: UITextField!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.returnKeyType = .done
        nameField.autocapitalizationType = .words
        nameField.autocorrectionType = .no
        nameField.becomeFirstResponder()
        nameField.delegate = self
        
    }
    
    
    @IBAction func nameFieldAct(_ sender: Any) {
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text
        if sk.getCurrentPlayerIndex() < (numPlayers - 1) {
            //add name to names list
            sk.addName(name: text ?? "null")
            
            //print current player index
            //print("cpi: \(sk.getCurrentPlayerIndex())")
            
            //print name 1: kiran
            let cpi = sk.getCurrentPlayerIndex()
            let currentName = sk.getName()
            print("name \(cpi) : \(currentName)")
            
            //print cpi
            print("cpi in names: \(sk.getCurrentPlayerIndex())")
            
            //increase player index
            sk.increaseCurrentPlayerIndex()
            
            //update enterNameLab text
            enterNameLab.text = "Enter name \(sk.getCurrentPlayerIndex() + 1)"
            
            //print enterNameLab
            print("\(enterNameLab.text)")
            
            nameField.text = ""
            print("selected: " + String(nameField.isSelected))
            print("focused: " + String(nameField.isFocused))
        }
        else {
            //add name to names list
            sk.addName(name: text ?? "null")
            
            //print current player index
            //print("cpi: \(sk.getCurrentPlayerIndex())")
            
            //print name 1: kiran
            let cpi = sk.getCurrentPlayerIndex()
            let currentName = sk.getName()
            print("name \(cpi) : \(currentName)")
            sk.resetCurrentPlayerIndex()

            //print cpi
            //print("cpi: \(sk.getCurrentPlayerIndex())")
            
            textField.resignFirstResponder()
            print("p1")
            //seugue
            performSegue(withIdentifier: "nametg", sender: nil)
            print("p2")
        }
        
        return true
    }
   
    

}



