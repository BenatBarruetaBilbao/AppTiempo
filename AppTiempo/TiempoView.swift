//
//  ContentView.swift
//  AppTiempo
//
//  Created by Beñat Barrueta on 7/2/24.
//

import SwiftUI

struct TiempoView: View {
    
    @State var latitud: String = ""
    @State var longitud: String = ""
    @StateObject var tiempoViewModel: TiempoViewModel = TiempoViewModel()
 
    var body: some View {
        NavigationView {
            VStack {
                Text("Latitud: ")
                TextEditor(text: $latitud)
                    .border(Color.black)
                    .frame(height: 35)
                Text("Longitud: ")
                TextEditor(text: $longitud)
                    .border(Color.black)
                    .frame(height: 35)
                Button("Buscar tiempo") {
                    tiempoViewModel.executeAPI(latitud: latitud, longitud: longitud)
                }
                    .padding()
                if let data = tiempoViewModel.dataModel {
                    Text("Temperatura en coordenadas: \(latitud), \(longitud)\n")
                    Text("\(data.hourly.temperature_2m.map{ "\($0)" }.joined(separator: ","))")
                } else if let error = tiempoViewModel.error{
                    Text("Ha habido algún error en el proceso: \(error.localizedDescription)")
                } else {
                    Text("No se ha realizado ninguna petición")
                }
                
                    
                            
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    TiempoView()
}
