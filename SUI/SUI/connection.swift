//
//  connection.swift
//  SUI


import SwiftUI

struct ConnectionView: View {
    var body: some View {
        NavigationLink {} label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                        .foregroundColor(.green)
                    Image("Svyaz")
                }
                
                Text("Сотовая связь")
                Spacer()
            }
        }
       
    }
}
