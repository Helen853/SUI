//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    @State var isOnTogle = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Карта1").font(.system(size: 20))
                .font(.system(size: 20, weight: .bold))
        }
        

        Spacer(minLength: 46)
        
        ZStack {
            RoundedRectangle(cornerRadius: 16 ).fill(Color.green).offset(x: isOnTogle ? 174: 0)
                .frame(width: 360, height: 200)
            Text("50 000,00 ₽").offset(x: isOnTogle ? 174: 0, y: 16)
                .frame(width: 290, height: 30)
                .foregroundColor(Color.white)
            Text("доступно").offset(x: isOnTogle ? 174: 0, y: 46)
                .frame(width: 290, height: 30)
                .foregroundColor(Color.white)
            
        }.animation(.spring())
        Spacer(minLength: 458)
        
        VStack {
            Toggle(isOn: $isOnTogle) {
                Text("Показать мой кошелек")
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
