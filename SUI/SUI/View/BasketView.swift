//
//  BasketView.swift
//  SUI

import SwiftUI

/// Вью корзины
struct BasketView: View {
    
    private enum Constants {
        static let title = "You choosed"
        static let description = "Please check and pay the selected tariff"
        static let calendarImage = "calendar"
        static let buttonName = "Bye"
    }
    
    @ObservedObject var viewModel: TariffViewModel
    
    var body: some View {
        VStack {
            Text(Constants.title)
                .font(.system(size: 24))
            Text(Constants.description)
                .font(.system(size: 16))
            ForEach(0..<viewModel.addedTariff.count, id: \.self) { index in
                AddedTariffView(addedTarif: $viewModel.addedTariff[index], viewModel: viewModel)
            }
            Spacer()
        }
    }
}
