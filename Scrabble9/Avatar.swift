//
//  ViewController.swift
//  Scrabble6
//
//  Created by Kiran Mahn on 21/12/2022.
//

import UIKit

var jellyfish = UIImage(named: "jellyfish.png")
var whale = UIImage(named: "Whale.png")
var atom = UIImage(named: "atom3.png")
var cactus = UIImage(named: "cactus.png")
var spade = UIImage(named: "spade.png")
var unicorn = UIImage(named: "Unicorn.png")


class Avatar: UIViewController {
    
    @IBOutlet weak var choosePlayerLab: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sk.initializeAvatar()
        //setup jellyfish button
        jellyfish = resizeImage(image: jellyfish!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: jellyfish!)
        b1.setImage(jellyfish, for: UIControl.State.normal)
        
        //setup jellyfish button
        whale = resizeImage(image: whale!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: whale!)
        b2.setImage(whale, for: UIControl.State.normal)
        
        //setup atom button
        atom = resizeImage(image: atom!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: atom!)
        b3.setImage(atom, for: UIControl.State.normal)
        
        //setup cactus button
        cactus = resizeImage(image: cactus!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: cactus!)
        b4.setImage(cactus, for: UIControl.State.normal)
        
        //setup spade button
        spade = resizeImage(image: spade!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: spade!)
        b5.setImage(spade, for: UIControl.State.normal)
        
        //setup unicorn button
        unicorn = resizeImage(image: unicorn!, targetSize: CGSizeMake(150, 150))
        sk.addAvatar(image: unicorn!)
        b6.setImage(unicorn, for: UIControl.State.normal)
                  
        let currentName = sk.getName()
        let newText = "Choose \(currentName)'s avatar"
        choosePlayerLab.text = newText

        
    }
    
    @IBAction func b1Ac(_ sender: Any) {
        selected(image: jellyfish!)
    }
     
    @IBAction func b2Ac(_ sender: Any) {
        selected(image: whale!)
    }
    @IBAction func b3Ac(_ sender: Any) {
        selected(image: atom!)
    }
    @IBAction func b4Ac(_ sender: Any) {
        selected(image: cactus!)
    }
    @IBAction func b5Ac(_ sender: Any) {
        selected(image: spade!)
    }
    @IBAction func b6Ac(_ sender: Any) {
        selected(image: unicorn!)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func selected(image: UIImage) {
        if sk.getCurrentPlayerIndex() < (numPlayers - 1) {
            //add avatar to list
            sk.addAvatar(image: image)
//             /\
              //\\
             //  \\
            //meow\\
            //increase cpi
            sk.increaseCurrentPlayerIndex()

            //update choose player text
            choosePlayerLab.text = "Choose \(sk.getName())'s avatar"
            
            
            
        }
        else {
            //add avatar to list
            sk.addAvatar(image: image)
            
            //reset cpi
            sk.resetCurrentPlayerIndex()
            
            //segue
            performSegue(withIdentifier: "toSIC", sender: nil)


        }
        
    }
    
    
}



