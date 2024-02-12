//
//  TiempoViewModel.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 7/2/24.
//

import Foundation
import SwiftUI
import Combine

class TiempoViewModel: ObservableObject {
    
    private var tiempoApiManager: TiempoApiManager = TiempoApiManager()
    private var cancellables = Set<AnyCancellable>()

    @Published var dataModel: DataModel?
    @Published var error: Error?
    
    func executeAPI(latitud: String, longitud: String){
        tiempoApiManager.executeAPI(latitud: latitud, longitud: longitud)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("[VIEWMODEL] FINISH REQUEST")
                    
                case .failure(let error):
                    print("[VIEWMODEL] FAILURE WITH ERROR: \(error)")
                }
            }, receiveValue: { value in
                print("[VIEWMODEL] RECEIVED VALUE: \(value)")
                self.dataModel = value
            })
            .store(in: &cancellables)
    }
}
