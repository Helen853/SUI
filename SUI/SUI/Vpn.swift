//
//  Vpn.swift
//  SUI


import SwiftUI

struct VpnView: View {
    @State var isOnVpn = false
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6).frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Image("Vpn")
            }
            
            
            Text("VPN")
            Spacer()
            Toggle(isOn: $isOnVpn) { }
        }
    }
}
