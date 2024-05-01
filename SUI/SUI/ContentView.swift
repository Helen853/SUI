//
//  ContentView.swift
//  SUI

import SwiftUI

struct ContentView: View {
    @State var isOnTogle = false
    @State var showAlert = false
    @State var showAction = false
    
    @State var balance1 = 500000
    @State var balance2 = 1000000
    @State var balance3 = 1000
    
    var body: some View {
        ZStack {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 5) {
                        Image("card")
                        
                        VStack() {
                            Text("\(balance1)").frame(width: 110, height: 20, alignment: .leading)
                                .offset(y: 8)
                                .font(.system(size: 14, weight: .bold))
                            Text("MIR  **0001").frame(width: 110, height: 15, alignment: .leading)
                                .font(.system(size: 10))
                        }
                    }.padding(.leading, 16)
                    Divider()
                    
                    HStack(alignment: .center, spacing: 5) {
                        Image("card")
                        
                        VStack {

                            Text("\(balance2)").frame(width: 110, height: 20, alignment: .leading)
                                .offset(y: 8)
                                .font(.system(size: 14, weight: .bold))
                            Text("MIR  **0002").frame(width: 110, height: 15, alignment: .leading)
                                .font(.system(size: 10))
                        }
                    }.padding(.leading, 16)
                    Divider()
                    
                    HStack(alignment: .center, spacing: 5) {
                        Image("card")
                        
                        VStack {
                            Text("\(balance3)").frame(width: 110, height: 20, alignment: .leading)
                                .offset(y: 8)
                                .font(.system(size: 14, weight: .bold))
                            Text("MIR  **0003").frame(width: 110, height: 15, alignment: .leading)
                                .font(.system(size: 10))
                        }
                    }.padding(.leading, 16)
                    Divider()
                    Spacer()
                }.padding(.top, 8).offset(y: 8)
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
                
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 16 ).fill(Color("ColorCard"))
                        .frame(width: 360, height: 200, alignment: .center)
                    
                    Text("\(balance1),00 ₽").offset(y: 16)
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
                
                Spacer(minLength: 22)
                
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 358, height: 88)
                        .cornerRadius(6)
                        .shadow(radius: 1, y: 4)
                    
                    HStack(alignment: .bottom, spacing: 14) {
                        Button(action: {
                            showAction = true
                            balance1 += 1000
                        }) {
                            VStack {
                                Image("Wallet")
                                Text("Пополнить").frame(width: 110, height: 34)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black)
                            }
                            .actionSheet(isPresented: $showAction) {
                                ActionSheet(title: Text("Баланс пополнен"), buttons: [.default(Text("Ok"))])
                            }
                            
                        }
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            VStack {
                                Image("wallet-minus")
                                Text("Перевести").frame(width: 110, height: 34)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black)
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Перевод"),
                                    message: Text("Перевести 1000 р на карту2?"),
                                    primaryButton: .default(Text("Ок"), action: {
                                      balance1 -= 1000
                                      balance2 += 1000
                                    }),
                                    secondaryButton: .cancel()
                                )
                            }
                        }
                        
                        Button(action: {}) {
                            VStack() {
                                Image("Wallet-plus")
                                Text("Открыть \n  карту").frame(width: 110, height: 34)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                }
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
