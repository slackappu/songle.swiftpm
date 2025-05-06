import SwiftUI
import AVFoundation

struct GuessView: View {
    @StateObject var audioManager = AudioManager()
    @State var userGuess: String = ""
    //    @State var audioPlayer: AVAudioPlayer?
    //    @State var currentTime: TimeInterval = 0
    //    @State var duration: TimeInterval = 0
    //    @State var timer: Timer?
    @State var userPreviousGuesses: [String] = []
    @State var showAlert = false
    @State var isCorrect = false
    //   @State var isPlaying = false
    @State var Alerthi = false
    @State var revealSong = false
    @State var guessCount = 0
    @State var showHintButton = false
    @State var maxGuesses = false
    var body: some View {
        VStack{
            Image("songle")
            Text("Guess the Song 🎶")
                .font(.custom("Futura", size: 34))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            ForEach(userPreviousGuesses, id: \.self) { guess in
                Text("• \(guess)")
                    .font(.custom("Futura", size: 20))
                    .foregroundStyle(.gray)
            }
            VStack(spacing:15){
                Text("Guesses left: \(max(0, 6 - guessCount))")
                //            Text("Song: Girls Trip")
                //            Text("Artist: YT")
                //            Image("oi")
                //                .resizable()
                //                .frame(width: 300, height: 300)
                //                .blur(radius: 20)
                //            Text("Song: Bristol")
                //            Text("Artist: Feng")
                Text("Time: \(formatTime(time: audioManager.currentTime)) / \(formatTime(time: audioManager.duration))")
            }
            .font(.custom("Futura", size: 18))
        }
    
        HStack(spacing: 30){
            Button {
                audioManager.playPause()
                print("User's guess: \(userGuess)")
            } label: {
                Image(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            Button(action: {
                audioManager.restart()
                //                if let player = audioPlayer, player.isPlaying {
                //                    player.currentTime = 0
                //                    player.play()
                //                    audioManager.startTimer()
                //                    audioManager.autoStop()
                //                }
            }){
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 35, height: 35)
                    .opacity(audioManager.isPlaying ? 1.0 : 0.4)
            }
            //       .disabled(!audioManager.isPlaying)
        }
        
        TextField("Enter your song guess", text: $userGuess)
            .font(.custom("Futura", size: 18))
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 300)
            .disabled(isCorrect)
        Text("Make sure you have proper spelling!")
            .font(.custom("Futura", size: 16))
            .foregroundStyle(.gray)
            .padding(.bottom, 10)
        Button("Submit Guess"){
            if guessCount >= 6 {
                maxGuesses = true
            } else {
                checkTheGuess()
            }
        }
                .font(.custom("Futura", size: 24))
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
                .cornerRadius(10)
                .disabled(isCorrect)
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
                        .font(.custom("Futura", size: 23))
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
            if guessCount >= 6 {
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
        }
        func checkTheGuess(){
            let trimmedGuess = userGuess.trimmingCharacters(in: .whitespacesAndNewlines)
            userPreviousGuesses.append(trimmedGuess)
            
            let answer = "long time"
            isCorrect = trimmedGuess.lowercased() == answer
            showAlert = true
            userGuess = ""
            
            guessCount += 1
            if guessCount >= 2 {
                showHintButton = true
            }
        }
        //    func stopSong(){
        //        audioPlayer?.stop()
        //        audioManager.isPlaying = false
        //        audioPlayer?.currentTime = 0
        //    }
        //    func startSong(){
        //        let soundName = "longTime"
        //        guard let soundFile = NSDataAsset(name: soundName) else {
        //            print("👺 \(soundName) is an invalid sound file")
        //            return
        //        }
        //        do {
        //            audioPlayer = try AVAudioPlayer(data: soundFile.data)
        //            duration = audioPlayer?.duration ?? 0
        //            audioPlayer?.play()
        //            audioManager.isPlaying = true
        //            autoStop()
        //            startTimer()
        //        } catch {
        //            print("Error: \(error.localizedDescription) from creating audio player")
        //        }
        //    }
        
        //    func autoStop() {
        //        timer?.invalidate()
        //        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
        //            DispatchQueue.main.async{
        //                if let player = audioPlayer, player.isPlaying {
        //                    stopSong()
        //                }
        //            }
        //        }
        //    }
        //        func startTimer() {
        //            var newTimer: Timer?
        //                newTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
        //                    DispatchQueue.main.async {
        //                        if let player = audioPlayer {
        //                            currentTime = player.currentTime
        //                            if !player.isPlaying {
        //                                timer?.invalidate()
        //                            }
        //                        }
        //                    }
        //                }
        //        timer = newTimer
        //            }
        //
        //            func playSong(){
        //                if let player = audioPlayer {
        //                    if player.isPlaying {
        //                        player.pause()
        //                        audioManager.isPlaying = false
        //       //                 timer?.invalidate()
        //                    } else {
        //                        player.play()
        //                        audioManager.isPlaying = true
        //                        autoStop()
        //                    }
        //                } else {
        //                    startSong()
        //                    audioManager.isPlaying = true
        //                    //            autoStop()
        //                }
        //            }
    }
    func formatTime(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    

    #Preview {
        GuessView()
    }

