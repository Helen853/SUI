//
//  CarViewModel.swift
//  SUI


import Foundation

/// ViewModel для основного вью
final class CarViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published public var price = 0
    
    // MARK: - Private Properties
    
    private var priceCasco = 190_000
    private var dopCasco = 90_000
    private var cars = StorageInfoCar()
    
    // MARK: - Public Methods
    
    /// Увеличение стоимости на стоимость каско
    func updatePrice(index: Int) {
        let currentPrice = self.cars.cars[index].price + self.priceCasco
        self.price = currentPrice
    }
    
    /// Увеличение стоимости на стоимость каско и доп. услуг
    func updatePriceCasco(index: Int) {
        let currentPrice = self.cars.cars[index].price + self.dopCasco + self.priceCasco
        self.price = currentPrice
    }
}
