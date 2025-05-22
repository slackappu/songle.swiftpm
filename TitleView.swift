import SwiftUI

struct TitleView: View {
    @State var showInstructions = false
    @StateObject var audioManager = AudioManager()
    var body: some View {
        NavigationStack {
//            ZStack {
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.purple, Color.blue]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea()
                VStack{
                    Image("transongle")
                        .frame(width: 200, height: 170)
                        .shadow(color: .red, radius: 10, x: 0, y: 0)
                    
                }
                Divider()
                VStack(spacing: 15) {
                    Text("How to Play")
                        .font(.custom("Futura", size: 32))
                        .underline()
                    VStack(spacing: 10){
                        Text("• A snippet of a song will play 👂        ")
                        Text("• You have 6 tries to guess the song 🎶")
                        Text("• Try to guess as fast as you can! 💨    ")
                    }
                }
                .frame(width:350, alignment: .leading)
                .opacity(0.75)
                .font(.custom("Futura", size: 18))
                Divider()
                Spacer()
                NavigationLink("Start the game!", destination: GuessView())
                    .frame(width: 300, height: 100)
                    .font(.custom("Futura", size: 38))
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .shadow(color: .purple, radius: 22, x: 0, y: 0)
                    .padding()
                Spacer(minLength: 200)
                Button {
                    showInstructions.toggle()
                } label: {
                    //                Text("Instructions for Guess View")
                    //                    .font(.title3)
                    //                    .foregroundStyle(.white)
                    //                    .padding()
                    //                    .background(.red)
                    //                    .cornerRadius(10)
                    //                    .shadow(color: .orange, radius: 5)
                    //            }
                    //            .padding(.top, 20)
                    //            .alert(isPresented: $showInstructions) {
                    //                Alert(
                    //                    title: Text("Guess View Instructions"),
                    //                    message: Text("• You have 6 tries to guess the correct song. 🎶\n\n• If you get it wrong, the song will play again. 👂\n\n• If you don't guess the correct song within 6 tries, the title will be revealed. 🎧"),
                    //                    dismissButton: .default(Text("Got it!"))
                    //                )

            }
        }
    }
}
