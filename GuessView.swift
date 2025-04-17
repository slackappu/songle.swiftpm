import SwiftUI

struct GuessView: View {
    @State var userGuess: String = ""
    var body: some View {
        VStack {
            Text("Guess the Song 🎶")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("Enter your song guess", text: $userGuess)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .padding(.bottom, 20)
            
            Button {
                print("User's guess: \(userGuess)")
            } label: {
                Text("Submit Guess")
                    .font(.title3)
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }

//            Image("Bristol")
//                .resizable()
//                .frame(width: 300, height: 300)
//                .blur(radius: 20)
//            Text("Song: Bristol")
//            Text("Artist: Feng")
        }
    }
}

#Preview {
    GuessView()
}

