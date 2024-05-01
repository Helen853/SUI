//
//  bluetooth.swift
//  SUI

import SwiftUI

struct BluetoothView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Image("bluetooth")
            }
            
            
            Text("Bluetooth")
            Spacer()
            Text("Вкл.").foregroundColor(Color.gray)
            Image("next")
        }
    }
}
