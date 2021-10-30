//
//  DetailView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//
//"lat": "-37.3159",
//      "lng": "81.1496"
import SwiftUI
import MapKit



//"id": 1,
//"name": "Leanne Graham",
//"username": "Bret",
//"email": "Sincere@april.biz",
//"address": {
//  "street": "Kulas Light",
//  "suite": "Apt. 556",
//  "city": "Gwenborough",
//  "zipcode": "92998-3874",
//  "geo": {
//    "lat": "-37.3159",
//    "lng": "81.1496"
//  }
//},
//"phone": "1-770-736-8031 x56442",
//"website": "hildegard.org",
//"company": {
//  "name": "Romaguera-Crona",
//  "catchPhrase": "Multi-layered client-server neural-net",
//  "bs": "harness real-time e-markets"
//}
//}
struct DetailView: View {
    @State var userId: Int
    @StateObject var viewModel = ViewModel()
    
    
    
    var body: some View {
            
        List {
            
            
            Section(header: Text("Telefono")) {
                Text(viewModel.usuarios?.phone ?? "")
            }
            
            Section(header: Text("Direccion")) {
                Text(viewModel.usuarios?.address.street ?? "")
                Text(viewModel.usuarios?.address.city ?? "")
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
