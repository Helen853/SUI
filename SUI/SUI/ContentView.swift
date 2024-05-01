//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    InfoView()
                    RecommendationView()
                }
                
                Section {
                    VersionView()
                }
                
                Section {
                    AirView()
                    WifiView()
                    BluetoothView()
                    ConnectionView()
                    ModemView()
                    VpnView()
                }
                
            }
            .navigationTitle("Настройки")
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
