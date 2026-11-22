//
//  MemoryCard.swift
//  Simemo
//
//  Created by Apprenant 31 on 30/10/2026.
//

import Foundation

struct MemoryCard: Hashable, Identifiable{
    var id = UUID()
    var idCard: Int
    var isFlipped: Bool = false
    var isPaired: Bool = false
    var image: String
}

var listPossibleImageOnCard = ["hare.fill", "teddybear.fill", "star.fill", "cloud", "sun.max", "sparkles", "moon", "snowflake", "cat.fill", "dog.fill", "ladybug", "lizard", "bird", "fish"]
