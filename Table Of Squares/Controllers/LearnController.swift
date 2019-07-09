//
//  FirstViewController.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 03/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//




// TODO: MAKE USER DEFAULTS FOR PROGRESS



import UIKit
class LearnController: UIViewController {
   
    let defaults = UserDefaults.standard
    @IBOutlet weak var completedImage1: UIImageView!
    @IBOutlet weak var completedImage2: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var to30PressedOutlet: UIButton!
    @IBOutlet weak var to100PressedOutlet: UIButton!
    @IBOutlet weak var testOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completedImage1.isHidden = true
        completedImage2.isHidden = true
        let image2 = defaults.bool(forKey: "2Image")
        if image2 {
            completedImage2.isHidden = false
        }
        let image1 = defaults.bool(forKey: "1Image")
        if image1 {
            completedImage1.isHidden = false
        }
        let score = defaults.integer(forKey: "score")
            scoreLabel.text = "Счет: \(score)"
        
        //to30PressedOutlet shadow
       to30PressedOutlet.backgroundColor = UIColor.white
        to30PressedOutlet.layer.cornerRadius = 15
        to30PressedOutlet.layer.shadowColor = UIColor.init(red: 65.0/255.0, green: 95.0/255.0, blue: 236.0/255.0, alpha: 1).cgColor
        to30PressedOutlet.layer.shadowOffset = CGSize(width: -5, height: 8)
        
        to30PressedOutlet.layer.shadowRadius = 30
        to30PressedOutlet.layer.shadowOpacity = 0.2
        
        
        //to 100pressedShadowOutlet shadow
        to100PressedOutlet.backgroundColor = UIColor.white
        to100PressedOutlet.layer.cornerRadius = 15
        to100PressedOutlet.layer.shadowColor = UIColor.init(red: 65.0/255.0, green: 95.0/255.0, blue: 236.0/255.0, alpha: 1).cgColor
        to100PressedOutlet.layer.shadowOffset = CGSize(width: -5, height: 8)
        
        to100PressedOutlet.layer.shadowRadius = 30
        to100PressedOutlet.layer.shadowOpacity = 0.2
        
        //testOutlet shadow
        testOutlet.backgroundColor = UIColor.white
        testOutlet.layer.cornerRadius = 15
        testOutlet.layer.shadowColor = UIColor.init(red: 65.0/255.0, green: 95.0/255.0, blue: 236.0/255.0, alpha: 1).cgColor
        testOutlet.layer.shadowOffset = CGSize(width: -5, height: 8)
        
        testOutlet.layer.shadowRadius = 30
        testOutlet.layer.shadowOpacity = 0.2
        
        
}
    
    
    
    @IBAction func To30Pressed(_ sender: Any) {
    let selectionVC = storyboard?.instantiateViewController(withIdentifier: "Studying") as! Studying // переход к Studying
        selectionVC.progressDelegate = self
        
        present(selectionVC, animated: true, completion: nil) // анимация перехода

        
    }
   
    
    
    @IBAction func to100Pressed(_ sender: Any) {
    let selectedVC = storyboard?.instantiateViewController(withIdentifier: "Studying2") as! Studying2 //переход к Studying 2
        selectedVC.completedDelegate = self
        present(selectedVC, animated: true, completion: nil) //анимация
        
    }
    
   
    
    
    
    @IBAction func testPressed(_ sender: Any) {
    let selectedVC = storyboard?.instantiateViewController(withIdentifier: "TestEasy")
        as! TestEasy
        present(selectedVC, animated: true, completion: nil)
        selectedVC.scoreDelegate = self
        
    }
    
} // end of the class

extension LearnController: getProgress {
    func progressFunction(prog: Bool) {
        if prog == true {
            completedImage1.isHidden = false
            defaults.set(prog, forKey: "1Image")
        }
    }
}

extension LearnController: completed {
    func completedInfo(progress: Bool) {
        if progress == true {
            completedImage2.isHidden = false
            defaults.set(progress, forKey: "2Image")
        }
    }
}


extension LearnController: progressProtocol {
    func progressAmount(progress: Int) {
        scoreLabel.text = "Счет: \(progress)"
        defaults.set(progress, forKey: "score")
    }
}
