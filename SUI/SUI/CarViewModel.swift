//
//  CarViewModel.swift
//  SUI


import Foundation

class CarViewModel: ObservableObject {
    @Published public var price = 0
    private var priceCasco = 190_000
    private var dopCasco = 90_000
    private var cars = StorageInfoCar()
    
    func updatePrice(index: Int) {
        let currentPrice = self.cars.cars[index].price + self.priceCasco
        self.price = currentPrice
    }
    
    func updatePriceCasco(index: Int) {
        let currentPrice = self.cars.cars[index].price + self.dopCasco + self.priceCasco
        self.price = currentPrice
    }
}
