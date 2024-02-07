//
//  File.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 7/2/24.
//

import SwiftUI
import Foundation
import Combine

class TiempoApiManager{
    
    @State private var dataModel: DataModel?
    
    struct Hourly:Decodable {
        let time: [String]
        let temperature_2m: [Float]
    }
    
    struct DataModel: Decodable {
        let hourly: Hourly
    }
    
    func executeAPI(latitud: String, longitud: String) {
        
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52,52&longitude=13,41&hourly=temperature_2m&forecast_days=1")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let result = try! JSONDecoder().decode(DataModel.self, from: data)
                print(result)
            }
        }.resume()
    }
}
