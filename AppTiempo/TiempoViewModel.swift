//
//  TiempoViewModel.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 7/2/24.
//

import Foundation
import SwiftUI
import Combine

class TiempoViewModel{
    
    private var tiempoApiManager: TiempoApiManager = TiempoApiManager()
    
    @State var dataModel: [DataModel] = []
    
    func executeAPI(latitud: String, longitud: String){
        let cancellable = tiempoApiManager.executeAPI(latitud: latitud, longitud: longitud)
            .sink { value in
                print(value)
            }
    }
}
