import SwiftUI
import AVFoundation

struct GuessView: View {
    @StateObject var audioManager = AudioManager()
    @State var userGuess: String = ""
    @State var userPreviousGuesses: [String] = []
    @State var showAlert = false
    @State var isCorrect = false
    @State var Alerthi = false
    @State var revealSong = false
    @State var guessCount = 0
    @State var showHintButton = false
    @State var maxGuesses = false
    @State var backgroundColor: Color = .white
    @State var navigateBack = false
    let correctAnswer = "long time"
    
    var body: some View {
        NavigationStack {
            ZStack {
                audioManager.backgroundColor
                    .ignoresSafeArea()
                    .animation(.easeInOut, value: audioManager.backgroundColor)
                VStack {
                    VStack {
                        Image("songle")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Text("Guess the Song 🎶")
                            .font(.custom("Futura", size: 30))
                            .fontWeight(.bold)
                        
                        ForEach(userPreviousGuesses, id: \.self) { guess in
                            HStack(alignment: .top) {
                                Text("•")
                                Text(guess)
                                    .foregroundStyle(guess.lowercased() == correctAnswer ? .green : .gray)
                            }
                        }
                        .font(.custom("Futura", size: 16))
                        .foregroundStyle(.gray)
                        .bold()
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
                    
                    HStack(spacing: 30) {
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
                        }){
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 35, height: 35)
                                .opacity(audioManager.isPlaying ? 1.0 : 0.4)
                        }
                        .disabled(!audioManager.isPlaying)
                    }
                    
                    TextField("Enter your song guess", text: $userGuess)
                        .font(.custom("Futura", size: 18))
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300)
                        .disabled(isCorrect)
                        .onSubmit {
                            if guessCount >= 6 {
                                maxGuesses = true
                            } else {
                                checkTheGuess()
                            }
                        }
                    Text("Make sure you have proper spelling!")
                        .font(.custom("Futura", size: 16))
                        .foregroundStyle(.gray)
                        .padding(.bottom, 10)
                    
                    Button("Submit Guess") {
                        if guessCount >= 6 {
                            maxGuesses = true
                        } else {
                            checkTheGuess()
                        }
                    }
                    .font(.custom("Futura", size: 15))
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
                                .frame(width: 120, height: 30)
                                .background(.orange)
                                .foregroundStyle(.white)
                                .font(.custom("Futura", size: 15))
                                .cornerRadius(10)
                                .shadow(color: .red, radius: 5)
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
                                .font(.custom("Futura", size: 15))
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                                .shadow(color: .purple, radius: 5)
                        }
                        .alert(isPresented: $revealSong) {
                            Alert(title: Text("Song Details"), message: Text("• Song: Long Time \n • Artist: Playboi Carti \n • Year Released: 2018"), dismissButton: .default(Text("Nice Try!")))
                        }
                    }
                    
                    if isCorrect {
                        NavigationLink(destination: TitleView(), isActive: $navigateBack) {
                            Button("Go Back to Title View") {
                                navigateBack = true
                            }
                            .font(.custom("Futura", size: 15))
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                            .shadow(color: .purple, radius: 5)
                        }
                    }
                }
                .animation(.easeInOut, value: audioManager.backgroundColor)
            }
        }
    }
    
    func checkTheGuess() {
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
        if isCorrect {
            audioManager.backgroundColor = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                audioManager.backgroundColor = .white
            }
        } else {
            audioManager.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                audioManager.backgroundColor = .white
            }
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

