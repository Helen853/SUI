//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    @State var showAlert1 = false
    @State var showAlert2 = false
    @State var showAlert3 = false
    @State var showAlert4 = false
    @State var title = "Пример Alert с 2 кнопками и логикой"
    @State var colorButton = "purpleForButton"

    var body: some View {
        Text("Alert & ActionSheet").font(.system(size: 20, weight: .bold))
        Spacer(minLength: 60)
        
        HStack(alignment: .top, spacing: 58) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Пример Alert").font(.system(size: 14, weight: .bold))
                    .frame(width: 150, height: 48, alignment: .leading)
                Text(title).font(.system(size: 14, weight: .bold))
                    .padding(2)
                    .frame(width: 150, height: 48)
                Text("Пример ActionSheet").font(.system(size: 14, weight: .bold))
                    .frame(width: 150, height: 48)
                Text("Пример ActionSheet кнопками и логикой").font(.system(size: 14, weight: .bold))
                    .frame(width: 150, height: 48)
                Spacer()
            }
            
            VStack(alignment: .trailing, spacing: 24) {
                Button {
                    self.showAlert1 = true
                } label: {
                    Text("Показать").font(.system(size: 14))
                        .frame(width: 150, height: 48)
                }
                .alert(isPresented: $showAlert1) {
                    Alert(title: Text("Показываю алерт"))
                }
                .foregroundColor(Color.white)
                .background(Color("purpleForButton"))
                .cornerRadius(12)
                .shadow(color: Color.gray, radius: 1, y: 4)

                
                Button {
                    self.showAlert2 = true
                } label: {
                    Text("Показать").font(.system(size: 14))
                        .frame(width: 150, height: 48)
                }
                .alert(isPresented: $showAlert2) {
                    Alert(
                        title: Text("Изменение текста"),
                        message: Text("Хотите изменить текст?"),
                        primaryButton: .default(Text("Да"), action: {
                            self.title = "Изменен"
                              }),
                        secondaryButton: .cancel()
                    )
                }
                .foregroundColor(Color.white)
                .background(Color("purpleForButton"))
                .cornerRadius(12)
                .shadow(color: Color.gray, radius: 1, y: 4)
                
                Button {
                    self.showAlert3 = true
                } label: {
                    Text("Показать").font(.system(size: 14))
                        .frame(width: 150, height: 48)
                }
                .actionSheet(isPresented: $showAlert3) {
                    ActionSheet(title: Text("Показываю actionSheet"), message: Text("пример"))
                }
                .foregroundColor(Color.white)
                .background(Color("purpleForButton"))
                .cornerRadius(12)
                .shadow(color: Color.gray, radius: 1, y: 4)
                
                Button {
                    self.showAlert4 = true
                } label: {
                    Text("Показать").font(.system(size: 14))
                        .frame(width: 150, height: 48)
                }
                .actionSheet(isPresented: $showAlert4) {
                    ActionSheet(title: Text("Хотите изменить увет кнопки?"), message: Text("Цвет будет изменен на розовый"), buttons: [.cancel(), .destructive(Text("OK"), action: {
                        self.colorButton = "pinkButton"
                    })])
                }
                .foregroundColor(Color.white)
                .background(Color(colorButton))
                .cornerRadius(12)
                .shadow(color: Color.gray, radius: 1, y: 4)
                Spacer()
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
