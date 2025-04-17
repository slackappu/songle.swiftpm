import SwiftUI
import AVFoundation
import AVFAudio

struct GuessView: View {
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack {
//            Image("Bristol")
//                .resizable()
//                .frame(width: 300, height: 300)
//                .blur(radius: 20)
            Button {
                playSong()
            } label: {
                Image(systemName: "play.circle.fill")
            }

            Text("Song: Bristol")
            Text("Artist: Feng")
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

