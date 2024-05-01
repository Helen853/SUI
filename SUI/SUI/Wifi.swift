//
//  Wifi.swift
//  SUI


import SwiftUI

struct WifiView: View {
    @State var section = 0
    @State var settingsWifi = ["Подключено", "Не подключено"]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Image("Wifi")
            }
            
            Text("Wi-Fi")
            Spacer()
            
            Picker(selection: $section, label: Text("")) {
                ForEach(0..<settingsWifi.count) {
                    Text(settingsWifi[$0])
                }
            }.pickerStyle(.navigationLink)
        }
    }
}
