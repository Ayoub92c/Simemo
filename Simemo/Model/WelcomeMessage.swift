//
//  WelcomeMessage.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//

import Foundation
enum WelcomeMessage {
    case message1, message2, message3
    
    var message: String{
        switch self{
        case .message1:
            return "La pratique d’un sport quotidien permet une meilleur oxygénation du cerveau ce qui impacte positivement la mémoire."
        case .message2:
            return "Faire des activités culturelles ou de réflexions aident aussi à cultiver sa mémoire"
        case .message3:
            return "C'est pendant la nuit que le cerveau trie, organise et consolide les informations de la journée"
        }
    }
    
    var funFact: String{
        switch self{
        case .message1:
            return "Faites un peu de sport, au moins 30min par jour pour aider votre mémoire"
        case .message2:
            return "Lisez ce qui vous fait plaisir !"
        case .message3:
            return "Avec un bon sommeil moins t'oublie"
        }
    }
}

var welcomeMessages: [WelcomeMessage] = [.message1, .message2, .message3]
