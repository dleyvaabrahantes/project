//
//  DetailView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI
import MapKit


struct DetailView: View {
    @State var userId: Int
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        List {
            
            Section(header: Text("Nombre")) {
                Text(viewModel.usuarios?.name ?? "")
            }
            
            Section(header: Text("Telefono")) {
                Text(viewModel.usuarios?.phone ?? "")
            }
            
            Section(header: Text("Direccion")) {
                Text(viewModel.usuarios?.address.street ?? "")
                Text(viewModel.usuarios?.address.city ?? "")
                MapView(coordinate: viewModel.usuarios?.locationCoordinate ?? CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
                    .frame(width: 100, height: 100)
            }
            Section(header: Text("Website")) {
                Text(viewModel.usuarios?.website ?? "")
            }
        }
        
        .onAppear{
            viewModel.requestUserDetail(userId)
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userId: 2)
    }
}
