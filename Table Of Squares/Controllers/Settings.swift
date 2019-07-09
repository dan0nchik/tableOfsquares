//
//  Settings.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 14/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import Foundation
import UIKit
class Settings: UIViewController {
    
    @IBOutlet weak var creditsOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creditsOutlet.backgroundColor = UIColor.white
        creditsOutlet.layer.cornerRadius = 15
        creditsOutlet.layer.shadowColor = UIColor.init(red: 65.0/255.0, green: 95.0/255.0, blue: 236.0/255.0, alpha: 1).cgColor
        creditsOutlet.layer.shadowOffset = CGSize(width: -5, height: 8)
        
        creditsOutlet.layer.shadowRadius = 30
        creditsOutlet .layer.shadowOpacity = 0.3
        
        
    }
    
    
    @IBAction func creditsPressed(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "Credits") as! Credits
        present(selectionVC, animated: true, completion: nil)
        
    }
    
}


