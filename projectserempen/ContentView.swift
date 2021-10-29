//
//  ContentView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                if let posts = viewModel.posts {
                    if posts.isEmpty {
                        ProgressView()
                            .padding()
                    } else {
                        VStack{
                            ForEach(viewModel.posts!, id:\.id){item in
                                Text(item.title)
                                
                            }
                        }
                    }
                    
                }
          
            }
        
        .navigationTitle("Project")
    }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
