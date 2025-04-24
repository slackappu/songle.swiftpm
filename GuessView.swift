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
    @State var guessCount = 0
    @State var showHintButton = false
    var body: some View {
        VStack {
            Text("Guess the Song 🎶")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .shadow(color: .blue, radius: 5)
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
        .shadow(color: .yellow, radius: 5)
        Button {
            playSong()
            print("User's guess: \(userGuess)")
        } label: {
            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
        }
        
        TextField("Enter your song guess", text: $userGuess)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 300)
            .shadow(color: .yellow, radius: 5)
        Text("Make sure you have proper spelling!")
            .foregroundStyle(.gray)
            .padding(.bottom, 20)
            .shadow(color: .yellow, radius: 5)
        Button("Submit Guess"){
            checkTheGuess()
        }
        .font(.title3)
        .padding()
        .background(Color.red)
        .foregroundStyle(.white)
        .cornerRadius(10)
        .shadow(color: .yellow, radius: 5)
        
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(isCorrect ? "Correct" : "Incorrect."),
                message: Text(isCorrect ? "Congratulations!" : "Try Again. You can do this!"),
                dismissButton: .default(Text("OK"))
            )
        }
        if guessCount >= 2 {
            Button(action: {
                Alerthi = true
            }) {
                Text("Tap For Hints")
                    .frame(width:150, height: 40)
                    .background(.orange)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .cornerRadius(10)
                    .shadow(color: .blue, radius: 5)
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
                .shadow(color: .blue, radius: 5)
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
        
        guessCount += 1
        
        if guessCount >= 2 {
            showHintButton = true
        }
    }
    func stopSong(){
        audioPlayer?.stop()
        isPlaying = false
        audioPlayer?.currentTime = 0
    }
    func startSong(){
        let soundName = "longTime"
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("👺 \(soundName) is an invalid sound file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            duration = audioPlayer?.duration ?? 0
            audioPlayer?.play()
            isPlaying = true
            autoStop()
            startTimer()
        } catch {
            print("Error: \(error.localizedDescription) from creating audio player")
        }
    }
    
    func autoStop() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            DispatchQueue.main.async{
                if let player = audioPlayer, player.isPlaying {
                    stopSong()
                }
            }
        }
    }
            func startTimer() {
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
            func playSong(){
                if let player = audioPlayer {
                    if player.isPlaying {
                        player.pause()
                        isPlaying = false
                        timer?.invalidate()
                    } else {
                        player.play()
                        isPlaying = true
                        autoStop()
                    }
                } else {
                    startSong()
                    isPlaying = true
                    //            autoStop()
                }
            }
        }
        
        
        func formatTime(time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%d:%02d", minutes, seconds)
        }


#Preview {
    GuessView()
}

