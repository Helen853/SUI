//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let logoName = "logo"
        static let color = "grayForGraund"
        static let infoText = "Информация об автомобиле"
        static let orderText = "Заказать"
        static let engine = "Двигатель"
        static let drive = "Привод"
        static let equipment = "Комплектация"
        static let casco = "ОМОДА Каско"
        static let turbo = "1.6 Тurbo"
        static let awd = "AWD"
        static let typeComplectation = ["Joy", "Lifestyle", "Ultimate", "Active", "Supreme"]
        static let price = "Цена"
        static let arrow = "arrow"
        static let circle = "blackCircle"
        static let actionButtonTitle = "ok"
        static let alertTitle = "ОМОДА Каско"
        static let action = "Благодарим за заказ. Наш менеджер свяжется с Вами в рабочее время для уточнения деталей"
        static let message = "Подключить Каско на выгодных условиях?"
        static let primaryButton = "Нет, не нужно"
        static let secondButton = "Да"
        
    }
    @State private var segmentedIndex = 0
    @State private var progress: Double = 2
    @State private var isShareInfo = false
    @State private var isOnTogle = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var currentPrice = 0
    @State private var typePrice: TypePriceCasco = .priceCasco
    
    @ObservedObject var viewModel = CarViewModel()
    @State private var cars = StorageInfoCar()

    
    var body: some View {
        VStack {
            Spacer(minLength: 76)
            HStack {
                Spacer()
                Image(Constants.logoName)
                Spacer()
                shareButton
            }.padding()
            
            Spacer(minLength: 22)
            Image(cars.cars[segmentedIndex].imageName)
                .frame(width: 345, height: 198)
            Spacer(minLength: 22)
            pickerView
            infoView
        }.background(Color(Constants.color))
    }
    
    private var shareButton: some View {
        Button {
            self.isShareInfo = true
        } label: {
            Image(Constants.arrow).frame(alignment: .trailing)
        }.sheet(isPresented: $isShareInfo) {
            ActivityView(activityItem: ["message"])
        }
    }
    
    private var pickerView: some View {
        Picker(selection: $segmentedIndex, label: Text("cars")) {
            ForEach(0..<cars.cars.count) {
                Text(self.cars.cars[$0].name)
            }
        }.pickerStyle(.segmented)
            .background(.white)
            .frame(height: 44)
            .cornerRadius(15)
            .padding()
    }
    
    private var infoView: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 390, height: 440)
            
            VStack {
                makeBoldText(text: Constants.infoText)
                
                HStack {
                    makeText(text: Constants.engine)
                    Spacer()
                    makeText(text: Constants.turbo)
                }.frame(height: 20)
                makeDivider()
                
                HStack {
                    makeText(text: Constants.drive)
                    Spacer()
                    makeText(text: Constants.awd)
                }.frame(height: 25)
                makeDivider()
                
                complectationView
                
                HStack {
                    makeText(text: Constants.casco)
                    Spacer()
                    Toggle(isOn: $isOnTogle) {
                        
                    }.onChange(of: isOnTogle, perform: { newValue
                        in
                        showAlert = newValue
                        self.typePrice = .priceCasco
                    })
                    .alert(Constants.alertTitle, isPresented: $showAlert) {
                        Button(Constants.secondButton) {
                            showAlert = false
                            self.typePrice = .priceAllCasco
                        }
                        Button(Constants.primaryButton) {
                            showAlert = false
                            isOnTogle = true
                            self.typePrice = .priceCasco
                        }
                    } message: {
                        Text(Constants.message)
                    }
                    .padding()
                        
                }.frame(height: 25)
                makeDivider()
                
                HStack {
                    makeBoldText(text: Constants.price)
                    Spacer()
                    makeBoldText(text: "\(returnPrice()) руб")
                }.frame(height: 25)
                orderButton
            }
        }
    }
    
    private var sliderView: some View {
        Slider(value: $progress, in: 1...6, step: 1)
            .accentColor(.black)
            .padding()
            .onAppear {
                UISlider.appearance().setThumbImage(UIImage(named: Constants.circle), for: .normal)
            }
            .frame(height: 8)
    }
    
    private var complectationView: some View {
        VStack(alignment: .leading) {
            makeText(text: Constants.equipment)
            sliderView
            
            HStack(spacing: 14) {
                ForEach(0..<Constants.typeComplectation.count) {
                    Text(Constants.typeComplectation[$0])
                        .font(.system(size: 12))
                        .frame(width: 60, height: 15, alignment: .center)
                }
            }
        }
    }
    
    private var orderButton: some View {
        Button(Constants.orderText) {
            showActionSheet = true
        }
            .frame(width: 358, height: 48)
            .background(Color(Constants.color))
            .cornerRadius(8)
            .foregroundColor(.white)
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text(Constants.action),
                    buttons: [.default(Text(Constants.actionButtonTitle))]
                )
            }
    }
    
    func makeText(text: String) -> some View {
        Text(text)
            .frame(height: 19, alignment: .leading)
            .foregroundColor(.black)
            .font(.system(size: 16))
            .padding()
    }
    
    func makeBoldText(text: String) -> some View {
        Text(text)
            .frame(height: 20, alignment: .leading)
            .foregroundColor(.black)
            .font(.system(size: 18, weight: .bold))
            .padding()
    }
    
    func makeDivider() -> some View {
        Divider()
            .frame(width: 250)
    }
    
    func returnPrice() -> String {
        if isOnTogle {
            switch typePrice {
            case .priceCasco:
                Task {
                    await MainActor.run {
                        self.viewModel.updatePrice(index: segmentedIndex)
                        self.currentPrice = self.viewModel.price
                    }
                }
                return "\(currentPrice)"
            case .priceAllCasco:
                Task {
                    await MainActor.run {
                        self.viewModel.updatePriceCasco(index: segmentedIndex)
                        self.currentPrice = self.viewModel.price
                    }
                }
                return "\(currentPrice)"
            }
        } else {
            return "\(self.cars.cars[segmentedIndex].price)"
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
