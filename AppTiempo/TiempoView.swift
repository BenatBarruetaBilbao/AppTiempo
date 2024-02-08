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
    @State var tiempoViewModel: TiempoViewModel = TiempoViewModel()
 
    var body: some View {
        NavigationView {
            VStack {
                Text("Latitud: ")
                TextEditor(text: $latitud)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(height: 35)
                Text("Longitud: ")
                TextEditor(text: $longitud)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(height: 35)
                //NavigationLink(){
                    Button("Buscar tiempo") {
                        tiempoViewModel.executeAPI(latitud: latitud, longitud: longitud)
                    }
                    .padding()
                
                //}
                Spacer()
                /*List {
                    ForEach(tiempoViewModel.dataModel, id: \.hourly) { dataModel in
                        HStack{
                            Text(String(dataModel.hourly.time.first!))
                        }
                    }
                }*/
            }
            .padding()
        }
    }
}

#Preview {
    TiempoView()
}
