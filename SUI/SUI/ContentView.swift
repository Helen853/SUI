//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    @State var isOnTogle = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("ColorGround"))
            
            VStack(alignment: .leading) {
                Spacer(minLength: 40)
                Text("Карта1").font(.system(size: 20, weight: .bold))
                    .frame(width: 290, height: 30, alignment: .leading)
                Spacer(minLength: 46)
                
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 16 ).fill(Color("ColorCard"))
                        .frame(width: 360, height: 200, alignment: .center)
                    
                    Text("50 000,00 ₽").offset(y: 16)
                        .frame(width: 290, height: 30, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("доступно").offset(y: 46)
                        .frame(width: 290, height: 30, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    Image("logo_mir").frame(width: 100, height: 42, alignment: .leading)
                        .offset(x: 110, y: 144)
                }
                
                Spacer(minLength: 22)
                
                ZStack {
                    Rectangle()
                        .fill()
                }
                
                
                Spacer(minLength: 339)
            }
            
            
        }
        .offset(x: isOnTogle ? 174: 0)
        .animation(.spring())
            
        VStack {
            Toggle(isOn: $isOnTogle) {
                Text("Показать мой кошелек").font(.system(size: 20, weight: .bold))
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
