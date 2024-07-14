//
//  ViewController.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 21/12/2022.
//

import UIKit

class WinnerScreen: UIViewController {
    
    @IBOutlet weak var winnerIsLab: UILabel!
    
    @IBOutlet weak var winnerNameLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerNameLab.text = sk.getWinner()
        
    }
    
    
}



