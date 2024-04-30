//
//  Buttons.swift
//  SUI

import SwiftUI

struct ButtonPanel: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 358, height: 88)
                .cornerRadius(6)
                .shadow(radius: 1, y: 4)
            
            HStack(alignment: .bottom, spacing: 14) {
                Button(action: {}) {
                    VStack {
                        Image("Wallet")
                        Text("Пополнить").frame(width: 110, height: 34)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                    }
                }
                
                Button(action: {}) {
                    VStack {
                        Image("wallet-minus")
                        Text("Перевести").frame(width: 110, height: 34)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
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
