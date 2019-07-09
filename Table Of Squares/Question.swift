//
//  QuestionAnswer.swift
//  Table Of Squares
//
//  Created by Daniel Khromov on 12/05/2019.
//  Copyright © 2019 Daniel Khromov. All rights reserved.
//

import Foundation

class Question
    
{
    
    let answer : String
    let questionText : String
    
    init(text : String, correctAnswer : String) {
        questionText = text
        answer = correctAnswer
    }
    
}
