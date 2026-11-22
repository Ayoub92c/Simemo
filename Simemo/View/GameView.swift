//
//  GameView.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//

import SwiftUI

struct GameView: View {
    let level: MemoryLevel
    @State var flippedCards: [Int] = []
    @State var closeGame = false
    @State var start: Date = Date.now
    @State var nombreDeCoups = 0
    @State var roundTime: String = ""
    @State var imageScale = Font.largeTitle
    @State private var LazyGridSpacing = 20.0
    @State private var cardWidth = 20.0
    @State private var cardHeight = 20.0
    @State private var endGame = false
    @State private var numberOfCardFlipped = 0
    @State private var numberOfPairMade = 0
    @State private var setOfCards = [
        MemoryCard(idCard: 0, isFlipped: false, isPaired: false, image: "heart.fill"),
        MemoryCard(idCard: 0, isFlipped: false, isPaired: false, image: "heart.fill"),
        MemoryCard(idCard: 1, isFlipped: false, isPaired: false, image: "tortoise.fill"),
        MemoryCard(idCard: 1, isFlipped: false, isPaired: false, image: "tortoise.fill"),
    ]
    @State var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func flipCard(cardToFlip: MemoryCard){
        if numberOfCardFlipped < 2 && !cardToFlip.isFlipped {
            nombreDeCoups += 1
            let index = setOfCards.firstIndex(where: {$0.id == cardToFlip.id})!
            if !setOfCards[index].isPaired {
                setOfCards[index].isFlipped.toggle()
                if setOfCards[index].isFlipped{
                    numberOfCardFlipped += 1
                    flippedCards += [index]
                }
            }
        }
    }
    
    func paired(cards: [MemoryCard], theCard: MemoryCard){
        if numberOfCardFlipped == 2 && setOfCards[flippedCards[0]].idCard == setOfCards[flippedCards[1]].idCard{
            setOfCards[flippedCards[0]].isPaired = true
            setOfCards[flippedCards[0]].isPaired = true
            numberOfPairMade += 1
            numberOfCardFlipped = 0
            flippedCards = []
        }
    }
          
    func failedToPaired(){
        if numberOfCardFlipped == 2{
            if setOfCards[flippedCards[0]].idCard != setOfCards[flippedCards[1]].idCard{
                setOfCards[flippedCards[0]].isFlipped.toggle()
                setOfCards[flippedCards[1]].isFlipped.toggle()
                numberOfCardFlipped = 0
                flippedCards = []
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
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20).fill(.level2).frame(width: 380, height: 80)
                        HStack{
                            Text(.currentDate, format: .timer(countingUpIn: start..<start.addingTimeInterval(3600)))
                            Image(systemName: "clock")
                        }.font(.largeTitle).bold().foregroundStyle(.police)
                    }
                    Spacer()
                    LazyVGrid(columns: columns, spacing: LazyGridSpacing){
                        ForEach(setOfCards, id: \.self){card in
                            VStack {
                                card.isFlipped
                                ?
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20).fill(. card2).frame(width: cardWidth, height: cardHeight).shadow(color: .black.opacity(0.5), radius: 0, y: 5)
                                    Image(systemName: card.image).foregroundStyle(.card).font(imageScale)
                                } :
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20).fill(.card).frame(width: cardWidth, height: cardHeight).shadow(color: .black.opacity(0.5), radius: 0, y: 5)
                                    Image(systemName: "bolt.fill").foregroundStyle(.card2).font(imageScale)
                                }
                                
                            }.onTapGesture{
                                flipCard(cardToFlip: card)
                                paired(cards: setOfCards, theCard: card)
                                Task{
                                    try? await Task.sleep(for: .seconds(1))
                                    failedToPaired()
                                }
                                if numberOfPairMade == setOfCards.count/2{
                                    roundTime = Duration
                                        .seconds(Date.now.timeIntervalSince(start))
                                        .formatted(.units(
                                            allowed: [.minutes, .seconds],
                                            width: .condensedAbbreviated,
                                            fractionalPart: .show(length: 2)
                                        ))
                                    nombreDeCoups /= 2
                                    endGame = true
                                }
                            }
                        }
                    }.padding(.horizontal)
                    Spacer()
                    HStack{
                        Text("Nombre de paires : ")
                        Spacer()
                        Text("\(numberOfPairMade) / \(setOfCards.count/2)")
                    }.font(.system(size: 25, design: .rounded)).padding().background(.level2).frame(width: 380).clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Memory").foregroundStyle(.police).font(.system(size: 20, design: .rounded)).bold()
                }
            }
        }.fullScreenCover(isPresented: $endGame){
            endGamePage(roundTime: $roundTime, nbrCoups: $nombreDeCoups, game: "Memory")
        }.onAppear{
            start = Date.now
            var i = 2
            while i < level.numberOfCards/2{
                setOfCards.append(MemoryCard(idCard: i, image: listPossibleImageOnCard[i-2]))
                setOfCards.append(MemoryCard(idCard: i, image: listPossibleImageOnCard[i-2]))
                i+=1
            }
            if !(setOfCards.count%4 == 0){
                columns += [GridItem(.flexible())]
            }
            setOfCards = setOfCards.shuffled()
            switch level{
            case .level4, .level3:
                LazyGridSpacing = 10
                cardWidth = 60
                cardHeight = 75
                imageScale = Font.title
            case .level1, .level2:
                LazyGridSpacing = 20
                cardWidth = 75
                cardHeight = 100
            }
        }
    }
}

#Preview {
    GameView(level: .level4)
}
