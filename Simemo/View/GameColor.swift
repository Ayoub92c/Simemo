//
//  GameColor.swift
//  Simemo
//
//  Created by Apprenant 08 on 30/10/2026.
//

import SwiftUI

struct GameColor: View {
    @State var sequence: [Color] = []
    @State var sequenceJoueur : [Color] = []
    let sequenceAdd: [Color] = [.red, .blue , .green, .yellow]
    @State var start: Date = Date.now
    @State var manche: Double = 0
    var monsiLevel: MemoryLevel
    @State var sequenceEnCours: Bool = false
    @State var demarrer = false
    @State  var greenSelected: Bool = false
    @State var redSelected: Bool = false
    @State  var blueSelected: Bool = false
    @State  var yellowSelected: Bool = false
    @State var roundTime: String = ""
    @State var victory: Bool = false
    @State var jeuEnCours: Bool = false
    @State var msgPerdu = ""
    
    func conceptionMonsi() {
        
        if sequenceJoueur == sequence {
            
            manche += 1
            
            sequenceJoueur = []
            
            sequence.append(sequenceAdd.randomElement()!)
            Task {
                msgPerdu = "Regardez !"
                try? await Task.sleep(for: .seconds(1))
                playSequence()
            }
            
            
            if Int(manche) ==  monsiLevel.nbCouleur {
                roundTime = Duration
                    .seconds(Date.now.timeIntervalSince(start))
                    .formatted(.units(
                        allowed: [.minutes, .seconds],
                        width: .condensedAbbreviated,
                        fractionalPart: .show(length: 2)
                    ))
                victory = true
                
            }
        }  else {
            for i in 0...sequenceJoueur.count-1 {
                if sequenceJoueur[i] != sequence[i]{
                    sequenceJoueur.removeAll()
                    
                    Task {
                        msgPerdu = "Regardez !"
                        try? await Task.sleep(for: .seconds(1))
                        playSequence()
                    }
                }
            }
        }
        
        print(sequenceJoueur)
        print(manche)
        print(sequence)
    }
    
    func playSequence() {
        
        msgPerdu = "Regardez !"
            
            
            for (index, color) in sequence.enumerated() {
                let delay = Double(index) * 0.9  // 0.5s entre chaque couleur

                
                // Allume la couleur
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    switch color {
                    case .red:    redSelected = true
                    case .blue:   blueSelected = true
                    case .green:  greenSelected = true
                    case .yellow: yellowSelected = true
                    default: break
                    }
                }
                // Éteint la couleur
                DispatchQueue.main.asyncAfter(deadline: .now() + delay + 0.7) {
                    switch color {
                    case .red:    redSelected = false
                    case .blue:   blueSelected = false
                    case .green:  greenSelected = false
                    case .yellow: yellowSelected = false
                    default: break
                    }
                }
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + manche + 1) {
            msgPerdu = "À vous !"
        }
       
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.88, blue: 1.0),
                        Color(red: 0.91, green: 0.72, blue: 1.0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                VStack{
                
                    
                    // Affiche le temps
                    
                        HStack{
                            if demarrer{
                                Text(.currentDate, format: .timer(countingUpIn: start..<start.addingTimeInterval(3600)))
                                    
                                    .font(.largeTitle)
                                    .foregroundStyle(.police)
                                    .bold()
                            } else {
                                Text("0:00")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundStyle(.police)
                            }
                            Image(systemName: "clock")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(.police)
                        }
                        .padding()
                        .frame(width: 380)
                        .background(.level2)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                   
                    
                    Spacer()
                    
                    // Circle couleur
                    VStack{
                        HStack{
                            Button{
                                
                                sequenceJoueur.append(.red)
                                
                                conceptionMonsi()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    redSelected = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    redSelected = false
                                }
                                
                            }label: {
                                Circle()
                                    .fill(redSelected ? .redLight : .redDark)
                                    .scaleEffect()
                            }
                            .frame(width: 150)
                            
                            Button{
                                
                                sequenceJoueur.append(.blue)
                                
                                conceptionMonsi()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                    blueSelected = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    blueSelected = false
                                }
                                
                                print(sequenceJoueur)
                                print(manche)
                                
                            }label: {
                                Circle()
                                    .fill(blueSelected ? .blueLight : .blue)
                                    
                                    .scaleEffect()
                            }
                            .frame(width: 150)
                        }
                        HStack{
                            
                            Button{
                                sequenceJoueur.append(.yellow)
                                
                                conceptionMonsi()
                                
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                    yellowSelected = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    yellowSelected = false
                                }
                                
                            }label: {
                                Circle()
                                    .fill(yellowSelected ? .yellowLight : .yellow)
                                    
                                    .scaleEffect()
                            }
                            .frame(width: 150)
                            Button{
                                
                                sequenceJoueur.append(.green)
                                
                                conceptionMonsi()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                    greenSelected = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    greenSelected = false
                                }
                                
                            }label: {
                                Circle()
                                    .fill(greenSelected ? .greenLight : .green)
                                   
                                    .scaleEffect()
                                
                            }
                            .frame(width: 150)
                        }
                    }
                    
                    Spacer()
                    
                    // Bouton demarage
                    Text(msgPerdu)
                        .foregroundStyle(.police)
                        .padding()
                        .bold()
                        .font(.title3)
                    
                    Button{
                        
                        jeuEnCours = true
                        
                        if jeuEnCours {
                            
                            sequence.append(sequenceAdd.randomElement()!)
                            print(sequence)
                            
                            playSequence()
                            
                        }
                        start = Date.now
                        demarrer = true
                        
                    }label: {
                        
                        if !jeuEnCours {
                            
                            Text("Démarrer")
                                .padding()
                                .bold()
                                .font(.system(size: 22, design: .rounded))
                                .background(.babyPink)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .foregroundStyle(.police)
                                .shadow(color: .police, radius: 0, y: 5)
                        }
                    }
                    
                    Spacer()
                    // Fin affiche le nombre d'enchainement
                    HStack{
                        Text("Nombre de manche : \(Int(manche)+1) / \(monsiLevel.nbCouleur)")
                            .foregroundStyle(.police)
                    }
                    .padding()
                    .font(.system(size: 20, design: .rounded))
                    .frame(width: 380)
                    .background(.level2)
                    .clipShape(RoundedRectangle(cornerRadius: 40))

                }.padding()
                
            }
            .navigationDestination(isPresented: $victory) {
                endGamePage(roundTime: $roundTime, nbrCoups: .constant(monsiLevel.nbCouleur), game: "Monsi")
                    .navigationBarBackButtonHidden()
            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Monsi")
                    .font(.system(size: 28, design: .rounded))
                    .bold()
                    .foregroundStyle(.police)
            }
        }
        // { du struct et body
    }
}


#Preview {
    GameColor( monsiLevel: .level1)
}
