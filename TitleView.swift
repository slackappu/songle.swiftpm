import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack{
            Text(" 🎵 Songle 🎵")
                .font(.largeTitle)
                .font(.custom("Times New Roman", size: 40))
                .bold()
            Divider()
        }
        VStack(spacing: 10){
            Text("How to Play")
                .underline()
                .font(.title)
            
            VStack(spacing: 10){
                Text("• A snippet of a song will play 👂            ")
                Text("• You have 6 tries to guess the song 🎶")
                Text("• Try to guess as fast as you can! 💨     ")
            }
            .frame(width:350, alignment: .leading)
            .opacity(0.75)
            Divider()
            
        NavigationStack{
            NavigationLink("Go to Guess View", destination: GuessView())
            }
        }
    }
}
