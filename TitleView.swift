import SwiftUI

struct TitleView: View {
    @State var showInstructions = false
    @StateObject var audioManager = AudioManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                       .ignoresSafeArea()
                
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    Image("songle")
                    // .frame(width: 200, height: 170)
                    // .font(.system(size: 85, weight: .bold))
                    // .foregroundStyle(Color.black)
                    // .background(.black)
                    // .foregroundColor(.white)
                    // .cornerRadius(10)
                    // .shadow(color: .red, radius: 15, x: 0, y: 0)
                    
                    
//                    Text("Songle 🎵")
//                        .font(.custom("Futura", size: 45))
//                        .fontWeight(.heavy)
//                        .foregroundColor(.white)
//                        .shadow(color: .black.opacity(0.7), radius: 5, x: 2, y: 2)
                    
                    Divider()
                        .background(Color.white.opacity(0.7))
                        .padding(.horizontal, 40)
                    
                    // Instructions Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("How to Play")
                            .font(.custom("Futura", size: 28))
                            .fontWeight(.bold)
                            .underline()
                            .foregroundColor(.white)
                        
                        Text("• A snippet of a song will play 👂")
                        Text("• You have 6 tries to guess the song 🎶")
                        Text("• Try to guess as fast as you can! 💨")
                    }
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white.opacity(0.85))
                    .frame(maxWidth: 350, alignment: .leading)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 1)
                    
                    Divider()
                        .background(Color.white.opacity(0.7))
                        .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    NavigationLink(destination: GuessView()) {
                        Text("Start the game!")
                            .font(.custom("Futura", size: 38))
                            .fontWeight(.bold)
                            .frame(width: 300, height: 100)
                            .background(
                                LinearGradient(
                                    colors: [Color.red, Color.blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: Color.purple.opacity(0.8), radius: 20, x: 0, y: 5)
                    }
                    .padding(.bottom, 50)
                    
                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
    }
}
