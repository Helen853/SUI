//
//  Modem.swift
//  SUI


import SwiftUI

struct ModemView: View {
    
    @State var section = 0
    @State var settingsModem = ["Вкл", "Выкл"]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.green)
                Image("modem")
            }
            
            
            Text("Режим модема")
            Spacer()
            Picker(selection: $section, label: Text("")) {
                ForEach(0..<settingsModem.count) {
                    Text(settingsModem[$0])
                }
            }.pickerStyle(.navigationLink)
        }
    }
}
