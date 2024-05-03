//
//  StorageSongs.swift
//  SUI
//
//  Created by Киса Мурлыса on 01.05.2024.
//

import Foundation

/// Хранилище информации о песняъ
struct StorageSongs {
    /// Массив с песнями
    var songs: [Song]
    
    // MARK: - Initializers

    init() {
        self.songs = [
            Song(
                songName: "Photograph",
                singerName: "J. Cole",
                photoName: "cole",
                fullName: "J. Cole - Photograph"),
            Song(
                songName: "jocelyn flowers",
                singerName: "xxxtentacion",
                photoName: "xxx",
                fullName: "xxxtentacion - jocelyn flowers",
            Song(
                songName: "CANT SAY",
                singerName: "Travis Scott",
                photoName: "travis",
                fullName: "Travis Scott - CANT SAY")
        ]
    }
}
