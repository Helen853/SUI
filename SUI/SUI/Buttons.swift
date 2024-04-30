//
//  Buttons.swift
//  SUI

import SwiftUI

struct ButtonPanel: View {
    @State var showAlert = false
    @State var balance = 100_000
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 358, height: 88)
                .cornerRadius(6)
                .shadow(radius: 1, y: 4)
            
            HStack(alignment: .bottom, spacing: 14) {
                Button(action: {
                    self.balance -= 1000
                    print(balance)
                    CardView(allBalance: balance)
                }) {
                    VStack {
                        Image("Wallet")
                        Text("Пополнить").frame(width: 110, height: 34)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                    }
                }
                
                Button(action: {
                    showAlert = true
                }) {
                    VStack {
                        Image("wallet-minus")
                        Text("Перевести").frame(width: 110, height: 34)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Перевод"),
                            message: Text("Перевести 1000 р на карту1?"),
                            primaryButton: .default(Text("Ок"), action: {
                                balance -= 1000
        
                                CardView(allBalance: balance)
                            }),
                            secondaryButton: .cancel()
                        )
                    }
                }
                
                Button(action: {}) {
                    VStack() {
                        Image("Wallet-plus")
                        Text("Открыть \n  карту").frame(width: 110, height: 34)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}
