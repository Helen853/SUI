//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    @State var isOnTogle = false
    
    var body: some View {
        ZStack {
            
            HStack(alignment: .top) {
                SidePanel().offset(y: 8)
                Spacer()
            }
            
            Spacer()
            Rectangle()
                .fill(Color("ColorGround"))
                .offset(x: isOnTogle ? 174: 0)
            
            VStack(alignment: .leading) {
                Spacer(minLength: 40)
                Text("Карта1").font(.system(size: 20, weight: .bold))
                    .frame(width: 290, height: 30, alignment: .leading)
                Spacer(minLength: 46)
                
                CardView()
                
                Spacer(minLength: 22)
                
                ButtonPanel()
                Spacer(minLength: 339)
            }.offset(x: isOnTogle ? 174: 0)
        }.animation(.spring())
            
        VStack {
            Toggle(isOn: $isOnTogle) {
                Text("Показать мой кошелек").font(.system(size: 20, weight: .bold))
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
