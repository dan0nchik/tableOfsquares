//
//  FirstViewController.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 03/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import UIKit

class Learn: UIViewController {
    @IBOutlet weak var from10To30: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
    }
    func animation() {
        self.from10To30.frame.origin.x -= 300
        UIView.animate(withDuration: 1) {
        self.from10To30.frame.origin.x += 300
        }
    }

}

