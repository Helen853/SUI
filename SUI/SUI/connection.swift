//
//  connection.swift
//  SUI


import SwiftUI

struct ConnectionView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.green)
                Image("Svyaz")
            }
            
            
            Text("Сотовая связь")
            Spacer()
            Image("next")
        }
    }
}
