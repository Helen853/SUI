//
//  VpnView.swift
//  SUI

import SwiftUI

/// Вью с впн
struct VpnView: View {
    
    private enum Constants {
        static let imageName = "flag"
        static let calendarImage = "calendar"
        static let ip = "IP Address"
        static let recevied = "Received"
        static let send = "Sent"
        static let numberIp = "127.0.0.1"
        static let mb = "MB"
        static let service = "Service will expire after 15 days."
        static let countSentMb = 0
    }
    
    @State var isOnToggle = false
    
    @ObservedObject var viewModel = VpnViewModel()
    
    var body: some View {
        VStack {
            Spacer(minLength: 124)
            Image(Constants.imageName)
            Spacer(minLength: 45)
            Toggle(isOn: $isOnToggle) {}
                .frame(width: 31)
                .onChange(of: isOnToggle) { newValue in
                    self.viewModel.start(load: isOnToggle)
                    self.viewModel.startSent(load: isOnToggle)
                    
                }

            Spacer(minLength: 55)
            HStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 14) {
                    Text(Constants.ip)
                    Text(Constants.recevied)
                    Text(Constants.send)
                }.bold()
                
                VStack(alignment: .trailing, spacing: 14) {
                    Text(Constants.numberIp)
                    Text("\(String(self.viewModel.countMb)) \(Constants.mb)")
                    Text("\(String(self.viewModel.countSentMb)) \(Constants.mb)")
                }.bold()
            }
            Spacer(minLength: 187)
            Text(Constants.service)
            Spacer()
        }
            
    }
}
