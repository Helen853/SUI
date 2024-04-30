//
//  SidePanel.swift
//  SUI

import SwiftUI

struct SidePanel: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(Balance.balanceText).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Text(Balance.balanceText2).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Text(Balance.balanceText3).frame(width: 110, height: 20, alignment: .leading)
                .font(.system(size: 14, weight: .bold))
            Spacer()
        }
    }
}
