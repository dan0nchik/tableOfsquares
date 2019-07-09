//
//  SecondViewController.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 03/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import UIKit

class Test: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func easyPressed(_ sender: Any)
    {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "TestEasy") as! TestEasy // переход к Studying
        present(selectionVC, animated: true, completion: nil) // анимация перехода
        
    }
    
    
    
}

