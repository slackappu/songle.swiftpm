import SwiftUI
import AVFoundation
import AVFAudio

struct GuessView: View {
    @State var userGuess: String = ""
    @State var audioPlayer: AVAudioPlayer?
    @State var currentTime: TimeInterval = 0
    @State var duration: TimeInterval = 0
    @State var timer: Timer?
    @State var showAlert = false
    @State var isCorrect = false
    @State var isPlaying = false
    @State var Alerthi = false
    @State var revealSong = false
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
            Text("Time: \(formatTime(time: currentTime)) / \(formatTime(time: duration))")
                }
        .padding(.bottom, 10)
            Button {
                if let player = audioPlayer {
                    if player.isPlaying {
                        player.pause()
                        isPlaying = false
                    } else {
                        player.play()
                        isPlaying = true
                    }
                } else {
                    playSong()
                    isPlaying = true
                }
                
                print("User's guess: \(userGuess)")
            } label: {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
            }
            
            TextField("Enter your song guess", text: $userGuess)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
            Text("Make sure you have proper spelling!")
                .foregroundStyle(.gray)
                .padding(.bottom, 20)
            Button("Submit Guess"){
                checkTheGuess()
            }
            .font(.title3)
            .padding()
            .background(Color.red)
            .foregroundStyle(.white)
            .cornerRadius(10)
        
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(isCorrect ? "Correct" : "Incorrect."),
                message: Text(isCorrect ? "Congratulations!" : "Try Again. You can do this!"),
                dismissButton: .default(Text("OK"))
            )
        }
        Button(action: {
            Alerthi = true
        }) {
            Text("Tap For Hints")
                .frame(width:150, height: 40)
                .background(.orange)
                .foregroundStyle(.white)
                .font(.title3)
                .cornerRadius(10)
        }
        .alert(isPresented: $Alerthi) {
            Alert(
                title: Text("🎶 Fun Fact!"),
                message: Text("""
                              Made By Playboi Carti.
                              Carti's first number-one song on the Billboard Hot 100.
                              """),
                dismissButton: .default(Text("Nice!"))
            )
        }
        Button(action: {
            revealSong = true
        }) {
            Text("Reveal Song!")
                .font(.title3)
                .foregroundStyle(.white)
                .padding()
                .background(.green)
                .cornerRadius(10)
                .shadow(color: .yellow, radius: 5)
        }
        .alert(isPresented: $revealSong) {
            Alert(title: Text("Song Details"), message: Text("• Song: Long Time \n • Artist: Playboi Carti \n • Year Released: 2018"), dismissButton: .default(Text("Nice Try!")))
        }
    }
    
    
    func checkTheGuess(){
        let answer = "long time"
        isCorrect = userGuess.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == answer
        showAlert = true
        userGuess = ""
    }
    
    func playSong(){
        let soundName = "longTime"
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("👺 \(soundName) is an invalid sound file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            duration = audioPlayer?.duration ?? 0
            audioPlayer?.play()
            startTimer()
        } catch {
            print("Error: \(error.localizedDescription) from creating audio player")
        }
    }
    func startTimer() {
        timer?.invalidate()
        
        var newTimer: Timer?
        newTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                if let player = audioPlayer {
                    currentTime = player.currentTime
                    if !player.isPlaying {
                       timer?.invalidate()
                    }
                }
            }
        }
        timer = newTimer
    }

        func formatTime(time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%d:%02d", minutes, seconds)
        }
    }
#Preview {
    GuessView()
}

