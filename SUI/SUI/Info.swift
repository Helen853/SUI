//
//  Info.swift
//  SUI


import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationLink {} label:  {
            HStack {
        
                Image("Avatar")
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Helen").font(.system(size: 22, weight: .bold))
                    Text("Apple ID, iCloud, контент и покупки").font(.system(size: 12))
                }
            }
        }
        
    }
}
