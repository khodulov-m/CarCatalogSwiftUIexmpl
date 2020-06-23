//
//  Car.swift
//  CarCatalog
//
//  Created by Michil Khodulov on 23.06.2020.
//  Copyright © 2020 Madmarik. All rights reserved.
//

import Foundation

struct Car: Identifiable, Decodable {
    
    let id: Int
    
    let model: String
    
    let category: String
    
    let power: Int
    
    let volume: Double?
    
    let brand: String
    
    let transmission: String
    let engine: String
    let price: String
    let imageName: String
}

let carData: [Car] = load("dataMock.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

