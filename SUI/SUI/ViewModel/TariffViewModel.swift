//
//  TariffViewModel.swift
//  SUI

import Foundation

/// ViewModel для вью с тариффами
final class TariffViewModel: ObservableObject {
    
    @Published public var addedTariff: [Tarif] = []
    var tariffList = StorageTariff()
    
    /// Добавление тарифа в массив корзины
    public func addedTariff(type: TypeTariff) {
        switch type {
        case .vacation:
            addedTariff.append(tariffList.tariffs[0])
        case .standart:
            addedTariff.append(tariffList.tariffs[1])
        case .standartPlus:
            addedTariff.append(tariffList.tariffs[2])
        }
        print(addedTariff)
    }
    
    /// Удаление тарифа с массива для корзины
    public func removeFromAddedTariff(tariff: Tarif) {
        guard let indexOfTariff = self.addedTariff.firstIndex(where: { $0.days == tariff.days }) else { return }
        addedTariff.remove(at: indexOfTariff)
    }
}
