import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack{
            Text("Songle")
                .font(.system(size: 50, weight: .bold))
                   .foregroundStyle(
                       LinearGradient(
                        gradient: Gradient(colors: [.purple, .blue, .green]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
                       )
                   )
                   .background(.black)
                       .foregroundColor(.white)
                       .cornerRadius(10)
                       .shadow(color: .pink, radius: 10, x: 0, y: 0)
                       .shadow(color: .purple, radius: 20, x: 0, y: 0)
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
                .font(.largeTitle)
                .foregroundStyle(.blue)
                .background(.black)
                .cornerRadius(15)
            }
        }
    }
}
