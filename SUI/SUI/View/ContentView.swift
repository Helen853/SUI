//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let lock = "exclamationmark.lock.fill"
        static let text = "list.dash"
        static let bye = "basket.fill"
        static let vpn = "VPN"
        static let purchase = "Purchase"
        static let basket = "Basket"
    }
    
    @ObservedObject var viewModel = TariffViewModel()
    
    var body: some View {
        TabView {
            VpnView()
                .tabItem {
                    Image(systemName: Constants.lock)
                    Text(Constants.vpn)
                }
            TariffView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: Constants.text)
                    Text(Constants.purchase)
                }
            BasketView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: Constants.bye)
                    Text(Constants.basket)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
