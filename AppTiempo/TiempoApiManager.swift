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
    
    func executeAPI(latitud: String, longitud: String) -> Future<DataModel, Error> {
        return Future { promise in
            let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitud)&longitude=\(longitud)&hourly=temperature_2m&forecast_days=1")!

            print("[API MANAGER] Requesting URL: \(url)")
            
            let urlRequest = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                switch (data, error) {
                case (_, .some(let error)):
                    promise(.failure(error))
                    
                case (.some(let data), _):
                    do {
                        let dataModel = try JSONDecoder().decode(DataModel.self, from: data)
                        promise(.success(dataModel))
                    } catch {
                        promise(.failure(error))
                    }

                case (.none, .none):
                    promise(.failure(NSError(domain: "No data & no error", code: 1)))

                }
            }.resume()
        }
    }
}
