//
//  File.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 7/2/24.
//

import SwiftUI
import Foundation
import Combine

class TiempoApiManager: ObservableObject{
    
    func executeAPI(latitud: String, longitud: String) -> Future<DataModel, Never> {
        return Future { promise in
            let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitud),0&longitude=\(longitud)&hourly=temperature_2m&forecast_days=1")!
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                guard let data else {
                    return
                }
                let dataModel = try! JSONDecoder().decode(DataModel.self, from: data)
                promise(.success(dataModel))
            }.resume()
        }
    }
}
