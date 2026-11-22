//
//  Level.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//

import Foundation
import SwiftUI

enum MemoryLevel: String{
    case level1, level2, level3, level4
    
    var name: String{
        switch self{
        case .level1:
            return "Niveau 1"
        case .level2:
            return "Niveau 2"
        case .level3:
            return "Niveau 3"
        case .level4:
            return "Niveau 4"
        }
    }
    var icon: [String]{
        switch self{
        case .level1:
            return ["star.fill","star","star","star"]
        case .level2:
            return ["star.fill","star.fill","star","star"]
        case .level3:
            return ["star.fill","star.fill","star.fill","star"]
        case .level4:
            return ["star.fill","star.fill","star.fill","star.fill"]
        }
        
    }
    var numberOfCards: Int{
        switch self{
        case .level1:
            return 8
        case .level2:
            return 16
        case .level3:
            return 24
        case .level4:
            return 30
        }
        
    }
    
    var color: Color{
        switch self{
        case .level1:
            return Color("level1Color")
        case .level2:
            return Color("level2Color")
        case .level3:
            return Color("level3Color")
        case .level4:
            return Color("level4Color")
        }
    }
    
    var nombreCharacter: Int{
        switch self{
        case .level1:
            return 6
        case .level2:
            return 7
        case .level3:
            return 8
        case .level4:
            return 9
        }
    }
    
    var nbCouleur: Int{
        switch self{
        case .level1:
            return 4
        case .level2:
            return 5
        case .level3:
            return 6
        case .level4:
            return 7
        }
    }

}
