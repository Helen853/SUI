//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    @State var isOnTogle = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20 ).fill(Color.red).offset(x: isOnTogle ? 100: 0)
            Text("Text").offset(x: isOnTogle ? 100: 0)
        }.animation(.spring())
        VStack {
            Toggle(isOn: $isOnTogle) {
                Text("hello")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
