//
//  SidePanel.swift
//  SUI

import SwiftUI

struct SidePanel: View {
    
    @State static var allBalance = 100000
    @State static var thousands = allBalance / 1000
    @State static var balanceText = "\(String(thousands)) 000,00 ₽"
 
    @State static var allBalance2 = 50000
    @State static var thousands2 = allBalance2 / 1000
    @State static var balanceText2 = "\(String(thousands2)) 000,00 ₽"
    
    @State static var allBalance3 = 1000
    @State static var thousands3 = allBalance3 / 1000
    @State static var balanceText3 = "\(String(thousands3)) 000,00 ₽"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(SidePanel.balanceText).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Text(SidePanel.balanceText).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Text(SidePanel.balanceText).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Spacer()
        }
    }
}
