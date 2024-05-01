//
//  Air.swift
//  SUI

import SwiftUI

struct AirView: View {
    @State var isOn = false

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.orange)
                Image("air")
            }
            
            Text("Авиарежим")
            Spacer()
            Toggle(isOn: $isOn) { }
        }
    }
}
