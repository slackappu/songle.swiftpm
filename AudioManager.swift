import SwiftUI
import AVFoundation

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var isPlaying = false
    @Published var audioPlayer: AVAudioPlayer?
    @Published var timer: Timer?
    @Published var autoStopTimerStarted = false
    @Published var autoStopTimer: Timer?
    @Published var savedTime: TimeInterval = 0
    @Published var backgroundColor: Color = .white
    @Published var soundName = ["long time", "my way", "nokia", "bus stop"]
    @Published var songCount = 0
    @Published var songName = ["longTime", "myWay", "nokia", "busStop"]
    
    
    func startSong() {
        guard let soundFile = NSDataAsset(name: songName[songCount]) else {
            print("👺 \(songName) is an invalid sound file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer?.delegate = self
            duration = audioPlayer?.duration ?? 0
            audioPlayer?.play()
            isPlaying = true
            startTimer()
           // autoStop()
        } catch {
            print("Error: \(error.localizedDescription) from creating audio player")
        }
    }

    func playPause() {
        guard let player = audioPlayer else {
            startSong()
            return
        }

        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
          //  autoStop()
        }
    }
    
    func restart() {
        if audioPlayer == nil {
            startSong()
            return
        }
        guard let player = audioPlayer else { return }
        player.currentTime = 0
        player.play()
        isPlaying = true
        startTimer()
       // autoStop()
    }

    func stopSong() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        currentTime = 0
        isPlaying = false
        timer?.invalidate()
        autoStopTimer?.invalidate()
        autoStopTimer = nil
        savedTime = 0
    }


    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            guard let player = audioPlayer else { return }
            currentTime = player.currentTime
            if !player.isPlaying {
                timer?.invalidate()
            }
        }
    }
    
    func autoStop() {
        autoStopTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { [self] _ in
            self.stopSong()
        }
    }
                                                          

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopSong()
    }
    var progressRatio: CGFloat {
        duration > 0 ? CGFloat(currentTime / duration) : 0
    }
}

