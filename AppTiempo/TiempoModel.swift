//
//  TiempoModel.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 8/2/24.
//

import Foundation

struct DataModel: Codable {
    let hourly: Hourly
    
    init(hourly: Hourly) {
        self.hourly = hourly
    }
}

struct Hourly: Codable {
    let time: [String]
    let temperature_2m: [Float]
    
    enum CodingKeys: CodingKey {
        case time
        case temperature_2m
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decode([String].self, forKey: .time)
        self.temperature_2m = try container.decode([Float].self, forKey: .temperature_2m)
    }
}
