//
//  GameRetiens.swift
//  Simemo
//
//  Created by Apprenant 31 on 02/11/2026.
//
//
import SwiftUI

struct GameRetiens: View {
    let retiensLevel: MemoryLevel
    @State private var textSwitch = true
    @State private var textaRetenir = ""
    @State private var endGame = false
    @State private var playerText = ""
    @State private var errorMessage = ""
    @State private var nbEssais = 1
    @State var retiensTime: String = ""
    @State var start: Date = Date.now
    func restart(){
        nbEssais += 1
        errorMessage = ""
        textaRetenir = ""
        playerText = ""
        while textaRetenir.count < retiensLevel.nombreCharacter{
            textaRetenir += "\(Int.random(in: 0...9))"
        }
        textSwitch = true
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
                        ZStack{
                            RoundedRectangle(cornerRadius: 20).fill(.level2).frame(width: 380, height: 80)
                            HStack{
                                Text(.currentDate, format: .timer(countingUpIn: start..<start.addingTimeInterval(3600)))
                                Image(systemName: "clock")
                            }.font(.largeTitle).bold()
                        }
                        Spacer()
                        if textSwitch {
                            VStack {
                                Text((textSwitch ? textaRetenir : "")).font(.title)
                            }
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                    self.textSwitch.toggle()
                                }
                            }
                        }
                        Spacer()
                        if !textSwitch{
                            TextField("Écris les chiffres", text: $playerText).keyboardType(.numberPad).padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 20)).onChange(of: playerText){
                                if playerText.count == retiensLevel.nombreCharacter{
                                    if playerText == textaRetenir{
                                        retiensTime = Duration
                                            .seconds(Date.now.timeIntervalSince(start))
                                            .formatted(.units(
                                                allowed: [.minutes, .seconds],
                                                width: .condensedAbbreviated,
                                                fractionalPart: .show(length: 2)
                                            ))
                                        print(retiensTime)
                                        endGame = true
                                    } else {
                                        errorMessage = "Mauvaise Réponse !"
                                    }
                                }
                            }
                        }
                        Spacer()
                        if !errorMessage.isEmpty{
                            Text(errorMessage).foregroundStyle(.red).font(.headline)
                            Button("Recommencer"){
                                restart()
                            }.padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        HStack{
                            Text("Nombre de chiffres : \(retiensLevel.nombreCharacter)").font(.system(size: 20, design: .rounded))
                        }
                        .padding()
                        .font(.system(size: 20, design: .rounded))
                        .frame(width: 380)
                        .background(.level2)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        
                    }.padding()
                }.foregroundColor(.police).toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Retiens").foregroundColor(.police)
                            .font(.system(size: 20, design: .rounded))
                            .bold()
                    }
                }
            }.fullScreenCover(isPresented: $endGame){
                endGamePage(roundTime: $retiensTime, nbrCoups: $nbEssais, game: "Retiens")
            }.onAppear{
                start = Date.now
                while textaRetenir.count < retiensLevel.nombreCharacter{
                    textaRetenir += "\(Int.random(in: 0...9))"
                }
            }
        }
}

#Preview {
    GameRetiens(retiensLevel: .level1)
}
