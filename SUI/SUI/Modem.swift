//
//  Modem.swift
//  SUI


import SwiftUI

struct ModemView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.green)
                Image("modem")
            }
            
            
            Text("Режим модема")
            Spacer()
            Text("Выкл.").foregroundColor(Color.gray)
            Image("next")
        }
    }
}
