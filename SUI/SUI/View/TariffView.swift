//
//  TariffView.swift
//  SUI

import SwiftUI

/// Вью со списком тарифов
struct TariffView: View {
    
    private enum Constants {
        static let title = "Privacy Matters"
        static let description = "Protect your online activities with VPN Plus"
        static let calendarImage = "calendar"
        static let buttonName = "Bye"
        static let buttonAddedName = "Added"
        static let bacgroundColor = "groundColor"
        static let buttonColor = "buttonColor"
        static let rubText = "RUB"
    }
    
    @State private var color = Constants.bacgroundColor
    @State private var color2 = Constants.bacgroundColor
    @State private var color3 = Constants.bacgroundColor
    @State private var isAdded7 = false
    @State private var isAdded30 = false
    @State private var isAdded90 = false
    @State private var buttonName = Constants.buttonName
    @State private var buttonName2 = Constants.buttonName
    @State private var buttonName3 = Constants.buttonName
    @State private var addedTarif: [Tarif] = []
    
    @ObservedObject var viewModel: TariffViewModel
    
    var tariffs = StorageTariff()
    
    var body: some View {
        VStack() {
            Text(Constants.title)
                .font(.system(size: 24))
            Text(Constants.description)
            tariff1
            tariff2
            tariff3
            Spacer()
        }
    }
    
    private var tariff1: some View {
        VStack {
            makeCalendar(count: (tariffs.tariffs[0].days))
            Text("\(tariffs.tariffs[0].description) \(String(tariffs.tariffs[0].summ)) \(Constants.rubText)")
            Button(buttonName) {
                self.isAdded7.toggle()
                if isAdded7 {
                    self.color = Constants.buttonColor
                    self.buttonName = Constants.buttonAddedName
                    self.viewModel.addedTariff(type: .vacation)
                    self.addedTarif = self.viewModel.addedTariff
                } else {
                    self.color = Constants.bacgroundColor
                    self.buttonName = Constants.buttonName
                    self.viewModel.removeFromAddedTariff(tariff: tariffs.tariffs[0])
                    self.addedTarif = self.viewModel.addedTariff
                }
            }.frame(width: 100, height: 48)
                .background(Color(color))
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private var tariff2: some View {
        VStack {
            makeCalendar(count: (tariffs.tariffs[1].days))
            Text("\(tariffs.tariffs[1].description) \(String(tariffs.tariffs[1].summ)) \(Constants.rubText)")
            Button(buttonName2) {
                self.isAdded30.toggle()
                if isAdded30 {
                    self.color2 = Constants.buttonColor
                    self.buttonName2 = Constants.buttonAddedName
                    self.viewModel.addedTariff(type: .standart)
                    self.addedTarif = self.viewModel.addedTariff
                    
                } else {
                    self.color2 = Constants.bacgroundColor
                    self.buttonName2 = Constants.buttonName
                    self.viewModel.removeFromAddedTariff(tariff: tariffs.tariffs[1])
                    self.addedTarif = self.viewModel.addedTariff
                }
            }.frame(width: 100, height: 48)
                .background(Color(color2))
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private var tariff3: some View {
        VStack {
            makeCalendar(count: (tariffs.tariffs[2].days))
            Text("\(tariffs.tariffs[2].description) \(String(tariffs.tariffs[2].summ)) \(Constants.rubText)")
            Button(buttonName3) {
                self.isAdded30.toggle()
                if isAdded30 {
                    self.color3 = Constants.buttonColor
                    self.buttonName3 = Constants.buttonAddedName
                    self.viewModel.addedTariff(type: .standartPlus)
                    self.addedTarif = self.viewModel.addedTariff
                } else {
                    self.color3 = Constants.bacgroundColor
                    self.buttonName3 = Constants.buttonName
                    self.viewModel.removeFromAddedTariff(tariff: tariffs.tariffs[2])
                    self.addedTarif = self.viewModel.addedTariff
                }
            }.frame(width: 100, height: 48)
                .background(Color(color3))
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private func makeCalendar(count: Int) -> some View {
        ZStack {
            Image(Constants.calendarImage)
            Text(String(count))
                .bold()
                .font(.system(size: 36))
                .foregroundColor(.black)
        }
    }
}
