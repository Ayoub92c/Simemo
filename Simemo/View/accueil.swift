import SwiftUI
import AVFoundation


struct accueil: View {
    // Tableau jeu 1 et 2
    var game: [Jeu] = [
        jeux[0], jeux[1], jeux[2]
    ]
    
    // Son
    @State private var audioPlayer: AVAudioPlayer?

    func playSound() {
        
        guard let soundURL = Bundle.main.url(
            forResource: "clique",
            withExtension: "mp3"
        ) else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Erreur lors de la lecture du son : \(error)")
        }
    }
    
    // Ecran principal
    var body: some View  {
        
        NavigationStack{
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
                    HStack{
                        Text("Stimémo")
                            .font(.system(size: 34, design: .rounded))
                            .foregroundStyle(.police)
                            .bold()
                            .padding()
                        Spacer()
                        NavigationLink {
                            Stat()
                        } label: {
                        Image(systemName:"person.circle.fill")
                            .resizable()
                            .shadow(radius: 20)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black ,.white)
                            .scaledToFit()
                            .frame(width: 45)
                            .padding()
                    }
                }
                    Spacer()
                    
                }
                // Affiche les 3 jeux
                VStack(spacing: 16){
                    ForEach(game, id: \.self) { gametab in
                        NavigationLink {
                            levelChoice(gameChoice: gametab)
                        } label: {
                            HStack {
                                Image(gametab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90)
                                    .padding()
                
                                Text("\(gametab.name)")
                                    .font(.system(size: 28,design: .rounded))
                                    .bold()
                                    .foregroundStyle(.police)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .padding()
                                    .scaledToFit()
                                    .frame(width: 60,height: 60)
                            }.padding()
                                .frame(width: 380, height: 190)
                                .background(.babyPink.opacity(0.90))
                                .background(.ultraThinMaterial)
                                .border(Color.babyPink, width: 2.5,)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: .police, radius: 0, y: 5)
                                .shadow(radius: 10)
                                
                            }
                            

                        }
                        //son
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                playSound()

                            }
                        )
                        // FIN SON
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        }


// Modale pour afficher le message de bienvenue WelcomeMessage
struct Modale: View {
    @State private var themeToAdd: String = ""
    @Binding var isModalOpened: Bool
    var body: some View {
        VStack(spacing: 50){
            HStack {
                Spacer()
                Button {
                    // Action pour fermer la modale
                    isModalOpened.toggle()
                } label: {
                    Image(systemName:"xmark")
                        .foregroundStyle(.police)
                }
                .padding()
                .background()
                .clipShape(Circle())
                .padding()
            }
            Spacer()
          
        Text("Bienvenue !")
                .padding()
                .font(.largeTitle)
            
           // Spacer()
            
            VStack(alignment: .leading) {
                
                // Message de l'enumeration WelcomeMessage
                if let message = welcomeMessages.randomElement() {
                    Text("\(message.message)")
                        .padding()
                        .font(.title2)
                        .bold()
                    Text("\(message.funFact)")
                        .padding()
                        .font(.title3)
                        .italic()
                        .bold()
                    Spacer()
                }

                
            }
        }
        .foregroundStyle(.police)
        .background(.level1)
    }
}

#Preview {
    accueil()
}
