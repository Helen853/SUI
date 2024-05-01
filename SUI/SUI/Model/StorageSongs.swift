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

    init() {
        self.songs = [
            Song(
                songName: "Photograph",
                singerName: "J. Cole",
                photoName: "cole",
                fullName: "J. Cole - Photograph", time: "03:15"),
            Song(
                songName: "jocelyn flowers",
                singerName: "xxxtentacion",
                photoName: "xxx",
                fullName: "xxxtentacion - jocelyn flowers", time: "02:48"),
            Song(
                songName: "CANT SAY",
                singerName: "Travis Scott",
                photoName: "travis",
                fullName: "Travis Scott - CANT SAY", time: "03:41")
        ]
    }
}
