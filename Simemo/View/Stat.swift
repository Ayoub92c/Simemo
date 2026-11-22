//
//  stat.swift
//  Simemo
//
//  Created by Patrice on 28/10/2026.
//

import SwiftUI

struct Stat: View {
    @State var modalProfil: Bool = false
        @State var photoProfil: String = "blueshark"
    var body: some View {
        NavigationStack{
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
            
                
                ScrollView {
                    
                    VStack (alignment: .leading, spacing: 20){
                        HStack {
                            Button(action: {
                                
                                modalProfil = true
                                
                            }, label: {
                                
                                Image(photoProfil)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                
                            })
                            Text(user1.name)
                                .padding()
                                .bold()
                                .font(.system(size: 28, design: .rounded))
                                .foregroundStyle(.police)
                        }
                        .padding()
                        
                        HStack {
                            VStack (alignment: .leading, spacing: 0){
                                Image(systemName: "flame.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                Text("Série")
                                    .font(.system(size: 40, design: .rounded))
                        }
                            .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("\(user1.timePlayedWeek)j")
                            
                                .font(.system(size: 90, design: .rounded))
                                .foregroundColor(.white)
                            
                        }
                        
                        .padding(20)
                        .frame(width: 379, height: 150)
                        .background(Color("streakColor")) // ou Color.streakColor
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                        ForEach (jeux, id:\.self) { jeu in
                            StatView(jeuName: jeu.name)
                        }
                        
                        
                        
                        HStack {
                            VStack (alignment: .leading, spacing: 0){
                                
                                Text("Temps joué aujourd'hui :")
                                Text("Temps joué cette semaine")
                                
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing, spacing: 0){
                                
                                Text("5min42")
                                Text("31min24")
                                
                                
                            }
                            
                        }
                        .padding(20)
                        .frame(width: 379, height: 150)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(.police)
                        
                        Spacer()
                    }
                }.scrollIndicators(.hidden)
                
            }.sheet(isPresented: $modalProfil) {
                profilPicture(fermeModal: $modalProfil, changeProfil: $photoProfil)
            }
        }
    }
}
    
    
#Preview {
    Stat()
}

