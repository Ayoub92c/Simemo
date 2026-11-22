//
//  Jeu.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//

import Foundation
import SwiftUI

struct Jeu: Hashable{
    var image: String
    var name: String
    var color: Color
    var description: String
    var endingGameMessage: String
}


var jeux = [

    Jeu(image: "memory", name: "Memory", color: .level1, description: """
Retrouvez les cartes identiques en mémorisant leur emplacement. Faites travailler votre mémoire pour reconstituer toutes les paires !
""", endingGameMessage: "test"),

    Jeu(image: "monsi", name: "Monsi", color: .level1, description: """
Mémorisez les couleurs affichées et retrouvez-les dans le bon ordre. Faites preuve de concentration pour éviter les erreurs !
""", endingGameMessage: "test"),

    Jeu(image: "retiens", name: "Retiens", color: .level1, description: """
Faites appel à votre mémoire pour retenir une série de chiffres et la restituer sans erreur.
""", endingGameMessage: "test")

]


struct Memory: Identifiable {
    var id = UUID()
    var jeu: Jeu
    var level: MemoryLevel
}


var memory = Memory(jeu: jeux[0], level: .level1)
var simon = Memory(jeu: jeux[1], level: .level1)
var retiens = Memory(jeu: jeux[2], level: .level1)
