//
//  User.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//


import Foundation
import SwiftUI

struct User{
    var name: String
    var image: String
    var streak: Int
    var score: Score
    var timePlayedWeek: Int
    var timePlayedDay: Double
    
}

enum Score{
    case level1, level2, level3, level4
}

var user1 = User(name: "Michel", image: "blueshark", streak: 2, score: .level1, timePlayedWeek: 6, timePlayedDay: 1234)
