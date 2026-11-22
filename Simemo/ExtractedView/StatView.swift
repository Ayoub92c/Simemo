//
//  StatView.swift
//  Simemo
//
//  Created by Patrice on 29/10/2026.
//

import SwiftUI

struct StatView: View {
    var jeuName: String
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 0){
                    
                    Text("Temps Record \(jeuName) :")
                        .font(.system(size: 20))
                        .bold()
                        .lineSpacing(4) // Espace ajouté entre les lignes
                        .padding(.vertical, 10) // Ajustement fin si nécessaire
                    Text("Niveau 1")
                    Text("Niveau 2")
                    Text("Niveau 3")
                    Text("Niveau 4")
                    
                }
                Spacer()
                VStack (alignment: .trailing, spacing: 0){
                    
                    Text("")
                        .font(.system(size: 20))
                        .lineSpacing(4) // Espace ajouté entre les lignes
                        .padding(.vertical, 10) // Ajustement fin si nécessaire
                    Text("13s")
                    Text("21s")
                    Text("39s")
                    Text("Non joué")
                    
                }
                
            }
            .padding(20)
            .frame(width: 379, height: 150)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .font(.system(size: 20, design: .rounded))
            .foregroundColor(.police)
        }
    }
}

#Preview {
    StatView(jeuName: jeux[0].name)
}
