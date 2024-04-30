//
//  CardView.swift
//  SUI

import SwiftUI

struct CardView: View {
    var allBalance = 100000
//    @State var thousands = allBalance / 1000
//    @State var balanceText = "\(String(thousands)) 000,00 ₽"
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16 ).fill(Color("ColorCard"))
                .frame(width: 360, height: 200, alignment: .center)
            
            Text("\(String(allBalance)),00 ₽").offset(y: 16)
                .frame(width: 290, height: 30, alignment: .leading)
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .bold))
            Text("доступно").offset(y: 46)
                .frame(width: 290, height: 30, alignment: .leading)
                .foregroundColor(Color.white)
                .font(.system(size: 16))
            Image("logo_mir").frame(width: 100, height: 42)
                .offset(x: 110, y: 144)
        }
    }
}
