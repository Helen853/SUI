//
//  Recommendation.swift
//  SUI


import SwiftUI

struct RecommendationView: View {
    var body: some View {
        HStack {
            Text("Предложения Apple ID")
                .frame(width: 260, height: 30, alignment: .leading)
            Spacer()
            Text("1").font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .background(Circle()
                    .foregroundColor(.red)
                    .frame(width: 25, height: 25))
            Spacer()
            Image("next")
        }
    }
}
