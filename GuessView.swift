import SwiftUI
import AVFoundation
import AVFAudio

struct GuessView: View {
    @State var userGuess: String = ""
    @State var showAlert = false
    @State var isCorrect = false
    @State var audioPlayer: AVAudioPlayer!
    @State var isPlaying = false
    var body: some View {
        VStack {
            Text("Guess the Song 🎶")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            //            Text("Song: Girls Trip")
            //            Text("Artist: YT")
            //            Image("oi")
            //                .resizable()
            //                .frame(width: 300, height: 300)
            //                .blur(radius: 20)
            //            Text("Song: Bristol")
            //            Text("Artist: Feng")
            Button {
                if !isPlaying {
                    playSong()
                    isPlaying = true
                } else if isPlaying {
                    audioPlayer.pause()
                    isPlaying = false
                }
                print("User's guess: \(userGuess)")
            } label: {
                Image(systemName: "play.circle.fill")
            }
            
            TextField("Enter your song guess", text: $userGuess)
                .multilineTextAlignment(.center)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .padding(.bottom, 20)
            Text("Make sure you have proper spelling!")
                .foregroundStyle(.gray)
            Button("Submit Guess"){
                checkTheGuess()
            }
            .font(.title3)
            .padding()
            .background(Color.red)
            .foregroundStyle(.white)
            .cornerRadius(10)
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(isCorrect ? "Correct" : "Incorrect."),
                message: Text(isCorrect ? "Congratulations!" : "Try Again. You can do this!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    
    func checkTheGuess(){
        let answer = "girls trip"
        isCorrect = userGuess.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == answer
        showAlert = true
        userGuess = ""
    }
    
    func playSong(){
        let soundName = "girlsTrip"
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

