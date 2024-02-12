//
//  TiempoModel.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 8/2/24.
//

import Foundation

struct DataModel: Codable {
    let hourly: Hourly
}

struct Hourly: Codable {
    let time: [String]
    let temperature_2m: [Float]
    
    enum CodingKeys: CodingKey {
        case time
        case temperature_2m
    }
}
