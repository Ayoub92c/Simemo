//
//  profilPicture.swift
//  Simemo
//
//  Created by Apprenant 09 on 03/11/2026.
//

import SwiftUI

struct profilPicture: View {
    @Binding var fermeModal: Bool
    @Binding var changeProfil: String
    var body: some View {
        
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
            
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        fermeModal = false
                        
                        
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                        
                    })
                    .padding()
                    .background()
                    .clipShape(Circle())
                    .padding()
                }
                
                Spacer()
                
                VStack {
                    
                    Text("Choisissez une photo de profil :")
                        .foregroundStyle(.police)
                        .bold()
                        .font(.title2)
                    
                    HStack{
                        
                        Button(action: {
                            
                            changeProfil = "pinkshark"
                            fermeModal = false
                            
                        }, label: {
                            
                            Image("pinkshark")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        })
                        
                        Button(action: {
                            
                            changeProfil = "blueshark"
                            fermeModal = false
                            
                        }, label: {
                            
                            Image("blueshark")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        })
                    }
                    .padding()
                    
                    HStack {
                        Button(action: {
                            
                            changeProfil = "duck"
                            fermeModal = false
                            
                        }, label: {
                            
                            Image("duck")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        })
                        
                        Button(action: {
                            
                            changeProfil = "perry"
                            fermeModal = false
                            
                        }, label: {
                            
                            Image("perry")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        })
                    }

                    
                }
                
                Spacer()
                
              
            }
        }
    }
}

#Preview {
    profilPicture(fermeModal: .constant(false), changeProfil: .constant(""))
}
