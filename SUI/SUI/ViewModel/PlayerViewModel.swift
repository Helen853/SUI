//
//  PlayerViewModel.swift
//  SUI

import AVFoundation
import Foundation

protocol PlayerViewModelProtocol {
    func play()
    func stop()
    func setTime(value: Double)
    func playSong(name: String)
}

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    @Published public var currentIndex = 1
    @Published public var time = "00:00"
    private var player: AVAudioPlayer?
    private var album = StorageSongs()
    
    
    public func play(index: Int) {
        playSong(name: album.songs[index].fullName)
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Double) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print("error")
        }
        
        let timer = Timer(
            timeInterval: 0.5,
            target: self,
            selector: #selector(setupTime),
            userInfo: nil,
            repeats: true
        )
        RunLoop.main.add(timer, forMode: .default)
    }
    
    @objc private func setupTime() {
        let currentTime = Int(player?.currentTime ?? 0)
        let minutes = currentTime / 60
        let seconds = currentTime - minutes * 60
        time = NSString(format: "%02d:%02d", minutes, seconds) as String
    }
}


