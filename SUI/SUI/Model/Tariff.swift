//
//  Tariff.swift
//  SUI


import Foundation

/// Модель тарифа
struct Tarif {
    /// Кол-во дней
    var days: Int
    /// Описание
    var description: String
    /// Стоимость
    var summ: Int
}

/// Хранилище тарифов
struct StorageTariff {
    /// Массив с тарифами
    var tariffs: [Tarif]
    
    init() {
        self.tariffs = [
            Tarif(days: 7, description: "Vacation (7 days)", summ: 99),
            Tarif(days: 30, description: "Standart (1 month)", summ: 179),
            Tarif(days: 90, description: "Standart+ (3 month)", summ: 279)
        ]
    }
}
