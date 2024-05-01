//
//  Version.swift
//  SUI


import SwiftUI

struct VersionView: View {
    var body: some View {
        HStack {
            Text("IOS 17.2: уже доступно")
                .frame(width: 260, height: 30, alignment: .leading)
            Spacer()
            
            Text("3").font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .background(Circle()
                    .foregroundColor(.red)
                    .frame(width: 25, height: 25))
            Spacer()
            Image("next")
        }
    }
}
