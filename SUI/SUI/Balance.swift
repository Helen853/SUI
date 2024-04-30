//
//  Balance.swift
//  SUI


import Foundation

struct Balance {
    static var allBalance = 100000
    static var thousands = allBalance / 1000
    static var balanceText = "\(String(thousands)) 000,00 ₽"
   
    static var allBalance2 = 50000
    static var thousands2 = allBalance2 / 1000
    static var balanceText2 = "\(String(thousands2)) 000,00 ₽"
   
    static var allBalance3 = 1000
    static var thousands3 = allBalance3 / 1000
    static var balanceText3 = "\(String(thousands3)) 000,00 ₽"
}
