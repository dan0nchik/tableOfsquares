//
//  Studying2.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 10/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import UIKit
import SAConfettiView


protocol completed
{
    func completedInfo(progress: Bool)
}
class Studying2: UIViewController {
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var leftButOutlet: UIButton!
    var completedBool = false
    var completedDelegate: completed!
    let textArray = ["Теперь пришло время изучать квадраты дальше!", "Начнем с двузначных чисел, заканчивающихся на 5","Важно: число заканчивается НА 5", "Нужно умножить его последнюю цифру на нее же +1", "Потом просто припишите справа 25", "Например:", ""]
    let imageArray = [UIImage.init(named: "hands"),UIImage.init(named: "clock"), UIImage.init(named: "attention"),UIImage.init(named: "multi"),UIImage.init(named: "add25"), UIImage.init(named: "example"), UIImage.init(named: "") ]
    var arrayCounter = 0 // счетчик для массива
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func confetti() {
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.type = .Triangle
        confettiView.startConfetti()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = textArray[0]
        imageView.image = imageArray[0]
        nextButtonOutlet.backgroundColor = UIColor.init(red: 54.0/255.0, green: 111.0/255.0, blue: 201.0/255.0, alpha: 1)
        nextButtonOutlet.layer.cornerRadius = 35
      
        leftButOutlet.isHidden = true
        
        leftButOutlet.backgroundColor = UIColor.init(red: 54.0/255.0, green: 111.0/255.0, blue: 201.0/255.0, alpha: 1)
        leftButOutlet.layer.cornerRadius = 35
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
    arrayCounter += 1
        textLabel.text = textArray[arrayCounter]
        imageView.image = imageArray[arrayCounter]
        alerting()
        leftButOutlet.isHidden = false
        
    }
    
    @IBAction func leftButPressed(_ sender: Any) {
        arrayCounter -= 1
        textLabel.text = textArray[arrayCounter]
        imageView.image = imageArray[arrayCounter]
        if arrayCounter == 0 {
            leftButOutlet.isHidden = true
        }
    }
    
    
    func alerting() {
        if arrayCounter == 6 {
            let alert = UIAlertController(title: "Круто!", message: "Вы закончили курс!", preferredStyle: .alert)
            
            let exitAction = UIAlertAction(title: "Выход", style: .default, handler: { UIAlertAction in self.dismiss(animated: true, completion: nil)
                self.completedBool = true
                self.completedDelegate!.completedInfo(progress: self.completedBool)
            })
            
            alert.addAction(exitAction)
            
            present(alert, animated: true, completion: nil)
            
            confetti()
        }
        }
    
    
    @IBAction func crossButtonPressed(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}


