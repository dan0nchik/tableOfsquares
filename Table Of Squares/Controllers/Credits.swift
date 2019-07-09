//
//  Credits.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 09/06/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import UIKit
class Credits: UIViewController {
    @IBOutlet weak var creditsOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creditsOutlet.backgroundColor = UIColor.init(red: 54.0/255.0, green: 111.0/255.0, blue: 201.0/255.0, alpha: 1)
        creditsOutlet.layer.cornerRadius = 35
}
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
