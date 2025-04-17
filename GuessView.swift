import SwiftUI
import AVFoundation
import AVFAudio

struct GuessView: View {
    @State var userGuess: String = ""
    @State var audioPlayer: AVAudioPlayer!
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
                playSong()
                print("User's guess: \(userGuess)")
            } label: {
                Text("Submit Guess")
                    .font(.title3)
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                Image(systemName: "play.circle.fill")
            }

            Text("Song: Bristol")
            Text("Artist: Feng")
//            Image("Bristol")
//                .resizable()
//                .frame(width: 300, height: 300)
//                .blur(radius: 20)
//            Text("Song: Bristol")
//            Text("Artist: Feng")
        }
    }
    func playSong(){
        let soundName = "bristolSong"
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("👺 \(soundName) is an invalid sound file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error: \(error.localizedDescription) from creating audio player")
        }
    }
}

#Preview {
    GuessView()
}

