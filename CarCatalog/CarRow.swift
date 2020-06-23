//
//  CarRow.swift
//  CarCatalog
//
//  Created by Michil Khodulov on 23.06.2020.
//  Copyright © 2020 Madmarik. All rights reserved.
//

import SwiftUI

struct CarRow: View {
    
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .leading)
                .clipped()
                .cornerRadius(16)
            VStack(alignment: .leading) {
                Text(car.model)
                    .bold()
                    .font(.body)
                Text(car.brand)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(car.price + "$")
        }
    }
}

struct CarRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CarRow(car: carData[0])
            CarRow(car: carData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
