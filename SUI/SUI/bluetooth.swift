//
//  bluetooth.swift
//  SUI

import SwiftUI

struct BluetoothView: View {
    
    @State var section = 0
    @State var settingsBluetooth = ["Вкл", "Выкл"]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Image("bluetooth")
            }
            
            
            Text("Bluetooth")
            Spacer()
            Picker(selection: $section, label: Text("")) {
                ForEach(0..<settingsBluetooth.count) {
                    Text(settingsBluetooth[$0])
                }
            }.pickerStyle(.navigationLink)
        }
    }
}
