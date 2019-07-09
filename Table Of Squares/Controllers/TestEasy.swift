//
//  TestEasy.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 10/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//






import UIKit

protocol progressProtocol
{
    func progressAmount(progress: Int)
}


class TestEasy: UIViewController{
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var nextOutlet: UIButton!
    
    var allQuestions = QuestionBank()
    var score: Int = 0
    var questionNumber = 0
    var checkAnswer = true
    var num = 0
     // таймер
    var timer = Timer()
    var timeLeft = 60
    var scoreDelegate: progressProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miniMenuAlert()
        allQuestions.list.shuffle()
        questionLabel.text = allQuestions.list[questionNumber].questionText
        //timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)

        nextOutlet.backgroundColor = UIColor.init(red: 54.0/255.0, green: 111.0/255.0, blue: 201.0/255.0, alpha: 1)
        nextOutlet.layer.cornerRadius = 35
        
    }
    
    func alerting() {
        let alert = UIAlertController(title: "Вы отлично постарались!", message: "Счет вы увидите в меню :)", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Выход", style: .default, handler: { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
            self.scoreDelegate?.progressAmount(progress: self.score)
        })
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    //timer
    @objc func onTimerFires()
    {
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"
        if timeLeft <= 10 {
            timeLabel.textColor = UIColor.red
        }
        if timeLeft <= 0 {
            timer.invalidate()
            alerting()
        }
        }
        

    
    
    @IBOutlet var scoreLabel: UILabel!

    
    @IBAction func crossPressed(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func truePressed(_ sender: Any)
    {
        /*print(questionLabel.text!)
        print(textField.text!)
        print(allQuestions.list[questionNumber].answer) */
        if textField.text == allQuestions.list[questionNumber].answer
        {       score += 10
                ProgressHUD.showSuccess("Верно!")
        }
        else {
            score -= 10
           ProgressHUD.showError("Неверно!")
            
        }
        scoreLabel.text = "Счет: \(score)"
         textField.text = ""
        questionNumber += 1 
        questionLabel.text = allQuestions.list[questionNumber].questionText
}
    
    
     func miniMenuAlert() {
        let menuAlert = UIAlertController(title: "Добро пожаловать!", message: "Выберите время в секундах", preferredStyle: .alert)
        
        let time1 = UIAlertAction(title: "60", style: .default, handler: { UIAlertAction in
            self.timeLeft = 60
        })
        menuAlert.addAction(time1)
        let time2 = UIAlertAction(title: "120", style: .default, handler: { UIAlertAction in
            self.timeLeft = 120
        })
        menuAlert.addAction(time2)
        let time3 = UIAlertAction(title: "180", style: .default, handler: { UIAlertAction in
            self.timeLeft = 180
        })
        menuAlert.addAction(time3)
        present(menuAlert, animated: true, completion: nil)
    }
    
}
