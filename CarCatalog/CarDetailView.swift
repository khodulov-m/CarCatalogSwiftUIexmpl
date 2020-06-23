//
//  CarDetailView.swift
//  CarCatalog
//
//  Created by Michil Khodulov on 23.06.2020.
//  Copyright © 2020 Madmarik. All rights reserved.
//

import SwiftUI

struct CarDetailView: View {
    
    var car: Car
    
    @State var showingBoughtAlert = false
    
    var body: some View {
        VStack {
            Image(car.imageName)
                .resizable()
                .scaledToFit()
            Text(car.model).font(.largeTitle)
            Text("Производитель: " + car.brand)
            
            Text("Двигатель: " + car.engine)
            Text("Объем: " + String(car.volume ?? 0) + " л")
            Text("Мощность: " + String(car.power) + " л.с.")
            Text("Трансмиссия: " + car.transmission)
            
            Spacer()
            
            Button(action: {
                self.showingBoughtAlert = true
            }) {
                if showingBoughtAlert {
                    Text("Куплено за $\(car.price)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.gray))
                        .cornerRadius(25)
                } else {
                    Text("Купить за $\(car.price)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.orange))
                        .cornerRadius(25)
                }
                
            }
        }
        .padding([.bottom], 16)
        .navigationBarTitle(Text("Информация о \(car.model)"), displayMode: .inline)
        .alert(isPresented: $showingBoughtAlert) {
            Alert(title: Text("Поздравляем!"), message: Text("Вы купили \(car.model)"), dismissButton: .cancel(Text("OK")))
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: carData[0])
    }
}
