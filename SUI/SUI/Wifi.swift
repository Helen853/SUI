//
//  Wifi.swift
//  SUI


import SwiftUI

struct WifiView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Image("Wifi")
            }
            
            
            Text("Wi-Fi")
            Spacer()
            Text("Не подключено").foregroundColor(Color.gray)
            Image("next")
        }
    }
}
