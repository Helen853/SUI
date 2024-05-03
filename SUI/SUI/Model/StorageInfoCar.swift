//
//  StorageInfoCar.swift
//  SUI


import Foundation

/// Хранилище информации о авто
struct StorageInfoCar {
    /// Массив с авто
    var cars: [Car]
    
    // MARK: - Initializers
    
    init() {
        self.cars = [
            Car(name: "C5", imageName: "c5", price: 2189900),
            Car(name: "S5", imageName: "s5", price: 1889900),
            Car(name: "S5 GT", imageName: "c5 gt", price: 2189900)
        ]
    }
}
