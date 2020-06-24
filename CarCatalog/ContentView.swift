//
//  ContentView.swift
//  CarCatalog
//
//  Created by Michil Khodulov on 23.06.2020.
//  Copyright © 2020 Madmarik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var cars = carData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        CarRow(car: car)
                    }
                }
            }
            .navigationBarTitle(Text("Каталог авто"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone Xs Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
