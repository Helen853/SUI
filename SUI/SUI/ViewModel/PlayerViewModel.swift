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
    private var player: AVAudioPlayer?
    private var album = StorageSongs()
    private var time = ""
    
    public func play(index: Int) {
        playSong(name: album.songs[index].fullName)
        player?.play()
    }
    
    public func returnTime(index: Int) -> String {
        guard let audioPath = Bundle.main.path(forResource: album.songs[index].fullName, ofType: "mp3") else { return ""}
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            let currentTime = Int(player?.currentTime ?? 0)
            let minutes = currentTime / 60
            let seconds = currentTime - minutes * 60
            time = NSString(format: "%02d:%02d", minutes, seconds) as String
            print(time)
        } catch {
            print("error")
        }
        return time
        
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
    }
}


