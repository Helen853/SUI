//
//  AddedTarifView.swift
//  SUI

import SwiftUI

/// Вью с добавленным в корзину тарифом
struct AddedTariffView: View {
    
    private enum Constants {
        static let calendarImage = "calendar"
        static let buttonName = "Bye"
        static let rubText = "RUB"
        static let alertTitle = "Вы успешно приобрели тариф на сумму"
    }
    
    @Binding var addedTarif: Tarif
    
    @State var showAlert = false
    
    @ObservedObject var viewModel: TariffViewModel
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(Constants.calendarImage)
                    Text("\(String(addedTarif.days))")
                        .bold()
                        .font(.system(size: 36))
                        .foregroundColor(.black)
                }.padding()
                Text("\(addedTarif.description) \n \(addedTarif.summ) \(Constants.rubText)")
                    .multilineTextAlignment(.center)
            }
            
            Button(Constants.buttonName) {
                self.showAlert = true
            }.frame(width: 342, height: 48)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .alert("\(Constants.alertTitle) \(addedTarif.summ) \(Constants.rubText)", isPresented: $showAlert) {
                    Button("ok") {
                        showAlert = false
                        self.viewModel.removeFromAddedTariff(tariff: addedTarif)
                    }
                }
        }
    }
}
