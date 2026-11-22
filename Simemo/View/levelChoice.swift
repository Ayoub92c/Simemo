//
//  levelChoice.swift
//  Simemo
//
//  Created by Apprenant 09 on 28/10/2026.
//

import SwiftUI

struct levelChoice: View {
    
    
    var levels: [MemoryLevel] = [.level1, .level2, .level3, .level4]
    var gameChoice : Jeu
    
    
    @State var card: MemoryLevel = .level1
    
    var body: some View {
       
        NavigationStack {
           
            
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.88, blue: 1.0),
                        Color(red: 0.91, green: 0.72, blue: 1.0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    
                    VStack (alignment: .leading){
                        Spacer()
                        VStack(alignment: .leading, spacing: 20){
                            
                            Text(gameChoice.description)
                                .padding()
                                .lineLimit(nil)
                                .font(.system(size: 18))
                                .bold()
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(16)
                Spacer()
                        VStack(spacing: 30){
                            
                            ForEach(levels, id: \.self) { levelsTab in
                                
                                ZStack {
                                    
                               
                                
                                Button(action: {
                                    
                                    card = levelsTab

                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(levelsTab.name).font(.title2).bold()
                                        
                                        Spacer()
                                        
                                        ForEach(levelsTab.icon, id: \.self) { icon in
                                            
                                            Image(systemName: icon)

                                        }
                                        
                                    }.padding()
                                    .frame(width: 350, height: 35)
                                       
                                })
                                }.padding()
                                    .background(levelsTab.color)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(.police, lineWidth: 4).opacity(card == levelsTab ? 1 : 0))
                                
                                
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    

                    
                    if gameChoice == jeux[0] {
                        
                        NavigationLink(destination: GameView(level: card), label: {
                            HStack{
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                
                                Text("Jouer")
                                    .bold()
                                    .font(.title)
                            }.padding()
                                .frame(width: 380, height: 80)
                                .background(.babyPink)
                                .shadow(radius: 20)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .police, radius: 0, y: 5)
                            

                            
                        })
                        
                    }
                    
                   else if gameChoice == jeux[1] {
                        
                       NavigationLink(destination: GameColor(monsiLevel: card), label: {
                            
                           HStack{
                               Image(systemName: "play.fill")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(height: 30)
                               
                               Text("Jouer")
                                   .bold()
                                   .font(.title)
                           }.padding()
                               .frame(width: 380, height: 80)
                               .background(.babyPink)
                               .shadow(radius: 20)
                               .clipShape(RoundedRectangle(cornerRadius: 20))
                               .shadow(color: .police, radius: 0, y: 5)
                            
                        })
                    
                    }
                    
                    else if gameChoice == jeux[2] {
                         
                         NavigationLink(destination: GameRetiens(retiensLevel: card), label: {
                             
                             HStack{
                                 Image(systemName: "play.fill")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(height: 30)
                                 
                                 Text("Jouer")
                                     .bold()
                                     .font(.title)
                             }.padding()
                                 .frame(width: 380, height: 80)
                                 .background(.babyPink)
                                 .shadow(radius: 20)
                                 .clipShape(RoundedRectangle(cornerRadius: 20))
                                 .shadow(color: .police, radius: 0, y: 5)
                             
                         })
                         
                     
                     }
                        
                      
                    Spacer()
                }
            }.foregroundStyle(.police)
        }

        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(gameChoice.name)
                    .foregroundStyle(.police)
                    .font(.system(size: 28, design: .rounded))
                    .bold()
            }
        }
    }
}


#Preview {
    NavigationStack {
        levelChoice(gameChoice: jeux[0])
    }
}
  
   




