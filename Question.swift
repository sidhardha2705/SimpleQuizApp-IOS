//
//  Question.swift
//  Quizzler
//
//  Created by sidhardha kadamati on 2019-05-30.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let questionLabel : String
    let answer : Bool
    
    init(text : String, isCorrect : Bool) {
        questionLabel = text
        answer = isCorrect
    }
}
