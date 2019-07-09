//
//  Learning.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 03/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import Foundation
import UIKit
import SAConfettiView

protocol getProgress {
    func progressFunction(prog: Bool)
}


class Studying: UIViewController
{
    
    var questionNumber: Int = 1
    var list = ["10² = 100","11² = 121","12² = 144","13² = 169","14² = 196","15² = 225","16² = 256","17² = 289","18² = 324","19² = 361","20² = 400","21² = 441","22² = 484","23² = 529","24² = 576","25² = 625","26² = 676","27² = 729","28² = 784","29² = 841", ""]
    
    var progressBool = false
    var progressDelegate : getProgress!
    
    @IBOutlet var hintLabel: UILabel!
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet var finishOutlet: UIButton!
    
    
    
    @IBAction func finishPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil) //переход назад
       
    }
    
    func confetti() {
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.type = .Confetti
        confettiView.startConfetti()
        progressBool = true
    }
    
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        
        finishOutlet.backgroundColor = UIColor.init(red: 54.0/255.0, green: 111.0/255.0, blue: 201.0/255.0, alpha: 1)
        finishOutlet.layer.cornerRadius = 35
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                updateUITrue()
                animationToRight()
            case .left:
                updateUIFalse()
                animationToLeft()
                
            default:
                break
            }
        }

    }
    
    
    
   
    
    func updateUITrue() {
        if questionNumber < 20 {
            cardLabel.text = list[questionNumber]
            questionNumber += 1
          
            if questionNumber == 20 {
            alerting()
            confetti()
            }
            
        }
    }
    func updateUIFalse() {
        if questionNumber < 20 {
            cardLabel.text = list[questionNumber]
            questionNumber -= 1
           
            if questionNumber == -1 {
               alerting2()
            }
            
        }
        
    }
    func animationToRight() {
        UIView .transition(with: cardImage, duration: 0.5, options: .transitionFlipFromLeft,
                           animations: {
                            
        }, completion: nil)
        UIView .transition(with: cardLabel, duration: 0.5, options: .transitionFlipFromLeft,
                           animations: {
                            
        }, completion: nil)
     
    }
    
    func animationToLeft() {
         UIView .transition(with: cardImage, duration: 0.5, options: .transitionFlipFromRight,
                           animations: {
                            
        }, completion: nil)
        UIView .transition(with: cardLabel, duration: 0.5, options: .transitionFlipFromRight,
                           animations: {
                            
        }, completion: nil) 
    }
    
    
    
    func alerting() {
        let alert = UIAlertController(title: "Круто!", message: "Вы закончили курс", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Выход", style: .default, handler: { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
            self.progressDelegate!.progressFunction(prog: self.progressBool)
        })
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    func alerting2() {
        let alert = UIAlertController(title: "Ой, вы только начали!", message: "Вы хотите выйти?", preferredStyle: .alert)
        
        let firstAction = UIAlertAction(title: "Выход", style: .default, handler: { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
            
        })
        let secondAction = UIAlertAction(title: "Продолжить", style: .default, handler: { UIAlertAction in
            self.questionNumber = 0
            
        })
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        
        present(alert, animated: true, completion: nil)
    }
    }
    

