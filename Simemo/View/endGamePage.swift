//
//  endGamePage.swift
//  Simemo
//
//  Created by Apprenant 37 on 28/10/2026.
//

import SwiftUI
import AVFoundation

struct endGamePage: View {
    @State private var replay = false
    @State private var leave = false
    @State private var messageFelicitation = ""

    @Binding var roundTime: String
    @Binding var nbrCoups: Int
    let game: String
    class SoundManager {
            static let instance = SoundManager()
            var player: AVAudioPlayer?

            func playSound(named soundName: String) {
                guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch _ {
                    print("Erreur lors de la lecture du son : (error.localizedDescription)")
                }
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
                
                VStack {
                    Spacer()
                    Image("trophy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 150)
                        .foregroundStyle(.yellow)
                        .padding()
                    Text("Gagné")
                        .foregroundColor(.police)
                        .font(.system(size: 50, weight: .heavy, design: .rounded))
                        .bold()
                    Spacer()
                    
                    Text(messageFelicitation)
                        .foregroundColor(.police)
                        .bold()
                        .font(.title2)
                    Spacer()
                    VStack(alignment: .leading){
                        if game == "Memory"{
                            HStack {
                                Text("Durée de la partie")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text(roundTime)
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            HStack {
                                Text ("Nombres de coups")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text("\(nbrCoups)")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            .padding(.vertical)
                        } else if game == "Retiens"{
                            HStack {
                                Text("Durée de la partie")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text(roundTime)
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            HStack {
                                Text ("Nombres d'essais")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text("\(nbrCoups)")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            .padding(.vertical)
                        } else if game == "Monsi" {
                            HStack {
                                Text("Durée de la partie")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text(roundTime)
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            HStack {
                                Text ("Nombres de manche")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text("\(nbrCoups)")
                                    .foregroundColor(.police)
                                    .bold()
                                    .font(.title3)
                            }
                            .padding(.vertical)
                        }
                        
                    }
                    .padding()
                    .background(.level1)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            replay = true
                        }, label: {
                            Text ("Rejouer")
                                .foregroundColor(.police)
                                .font(.title)
                                .bold()
                                .padding()
                                .frame(width:380,height: 80)
                                .background(.level3)
                                .shadow(radius:
                                        32)
                                .clipShape(RoundedRectangle(cornerRadius: 32))
                                .shadow(color: .police, radius: 0, y: 5)
                        })
                        
                        Button(action: {
                            leave = true
                        }, label: {
                            Text ("Quitter")
                                .foregroundColor(.police)
                                .font(.title)
                                .bold()
                                .padding()
                                .frame(width: 380,height: 80)
                                .background(.level1)
                                .border(Color.level1, width: 2.5,)
                                .clipShape(RoundedRectangle(cornerRadius: 32))
                                .shadow(color: .police, radius: 0, y: 5)
                            })
                       
                        
                    }
                }
                
            }
           
            
            .navigationDestination(isPresented: $replay) {
                switch game {
                case "Memory":
                    levelChoice(gameChoice: jeux[0])
                case "Monsi":
                    levelChoice(gameChoice: jeux[1])
                default:
                    levelChoice(gameChoice: jeux[2])
                }
                        }
            .navigationDestination(isPresented: $leave) {
                accueil()
                }

        }.onAppear{
            SoundManager.instance.playSound(named: "win")
            if game == "Memory"{
                messageFelicitation = ["Tu as trouvé toutes les paires du Memory !", "Bravo pour ta mémoire" ,"Quelle belle performance ! c'est toujours un plaisir de se surpasser" , "Quel succés ! Chapeau bas !!"
                ].randomElement()!}
                
            else if game == "Monsi"{
                messageFelicitation = ["Bien joué ! Tu as terminé le niveau avec brio, plus qu'à lancer la suite." , "Bravo ! Plein succès pour ce niveau" , "Bravo pour ce nouveau défi; pleine réussite pour le prochain"
                ].randomElement()!}
            
            else if game == "Retiens"{
                messageFelicitation = ["Bravo pour ta mémoire" , "Bravo ! plein succès pour ce niveau" , "Bravo pour cette belle victoire, tu as mené la partie d'une main de maître!" , "La classe ! Tu as pulvérisé tous les scores, respect."
                ].randomElement()!
            
                
                    
                    
                    
            }
        }
  
            
            }
        }

    #Preview {
        endGamePage(roundTime: .constant("14,85 secs"), nbrCoups: .constant(1), game: "Retiens")
    }

