//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let cars = ["C5", "S5", "S5 GT"]
        static let image = ["c5", "s5", "c5 gt"]
        static let logoName = "logo"
        static let color = "grayForGraund"
        
    }
    @State var segmentedIndex = 0
    @State private var isShareInfo = false
    var cars = Constants.cars
    var image = Constants.image
    
    var body: some View {
        VStack {
            ZStack {
                Color(Constants.color)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 780)
                VStack {
                    Spacer()
                    Image(Constants.logoName)
                    Image(image[segmentedIndex])
                        .frame(width: 345, height: 198)
                    Picker(selection: $segmentedIndex, label: Text("cars")) {
                        ForEach(0..<cars.count) {
                            Text(self.cars[$0])
                        }
                    }.pickerStyle(.segmented)
                        .background(.white)
                        .frame(height: 44)
                        .padding()
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .frame(width: 390, height: 440)
                        
                        Button("share") {
                            self.isShareInfo = true
                        }.sheet(isPresented: $isShareInfo) {
                            ActivityView(activityItem: ["message"])
                        }
                    }
                    
                }
                
               
            }
            
            //Spacer().frame(height: 150)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
