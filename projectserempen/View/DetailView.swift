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
      @State var post: Post
     @State var user: User
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                Text("David Leyva")
                    .font(.title)
                Text("username")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack{
                VStack(alignment: .leading){
                    Group{
                Text("Email:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                        Text("dleyvaabrahantes@gmail.com")
                            .padding(.top,2)
                    }
                    Divider()
                    Text("Direccion")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("dleyvaabrahantes@gmail.com")
                        .padding(.top,2)
                }
                Spacer()
               
            }
            .padding()
            
            
            
        }.frame(maxWidth: .infinity)
        
        
        
        
        
    }
    
    //    private func setCoordinate(latitude: String, longitude: String) {
    //            region = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    //        }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
