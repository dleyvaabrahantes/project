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
            
            if let posts = viewModel.posts{
                if posts.isEmpty{
                    ProgressView()
                        .padding()
                        .toolbar{
                            
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button(action: {viewModel.requestCode()}){
                                        Image(systemName: "arrow.counterclockwise")
                                    }
                                    
                                }
                            
                                
                            
                            
                            
                        }
                    
                }else {
                    List{
                        ForEach(viewModel.posts!, id: \.id){item in
                            NavigationLink(destination: DetailView(userId: item.userId)){
                                PostView(post: item)
                                
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    
                    .navigationTitle("Project")
                    .toolbar{
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {viewModel.posts?.removeAll()}){
                                Image(systemName: "trash")
                            }
                        }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {viewModel.requestCode()}){
                                    Image(systemName: "arrow.counterclockwise")
                                }
                                
                            }
                            
                        
                        
                        
                    }
                }
                
            }
            
        }
        
        
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.posts!.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 {
 ScrollView{
 if let posts = viewModel.posts {
 if posts.isEmpty {
 ProgressView()
 .padding()
 } else {
 VStack(alignment: .leading){
 
 ForEach(viewModel.posts!, id: \.id){item in
 NavigationLink(destination: DetailView(userId: item.userId)
 .navigationTitle(item.title)
 .toolbar{
 Button(action: {print("Hola")}, label: {
 Image(systemName: "star")
 })
 }){
 PostView(post: item)
 
 }
 }
 
 
 }
 }
 
 }
 
 }
 
 .navigationTitle("Project")
 }
 
 */
