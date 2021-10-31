//
//  ContentView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showFavoriteOnly = false
    

    var filteredPost:[Post]{
        viewModel.posts!.filter({
            post in (!showFavoriteOnly || post.isFavorite)
        })
    }
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
                        Toggle(isOn: $showFavoriteOnly, label: {
                            Text("Favoritos Only")
                        })
                        ForEach(filteredPost, id: \.id){item in
                            NavigationLink(destination: DetailView(userId: item.userId).onAppear{
                                setRead(item)
                            }){
                                
                                PostView(post: item)
                                
                            }
                            .swipeActions(allowsFullSwipe: false) {
                                Button {
                                    setFavorite(item)
                                } label: {
                                    Label("Favorito", systemImage: "star.fill")
                                }
                                .tint(.blue)
                                
                                Button(role: .destructive) {
                                    deleteObj(item)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    setRead(item)
                                } label: {
                                    Label("leido", systemImage: "star.fill")
                                }
                                .tint(.blue)
                                
                                
                            }
                        }
                        
                        
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
    
    func deleteObj(_ item: Post) {
        if let indexToDelete = viewModel.posts?.firstIndex(where: {$0.id == item.id}){
        viewModel.posts!.remove(at: indexToDelete)
        }
    }
    
    func setFavorite(_ item: Post) {
        if let indexToFav = viewModel.posts?.firstIndex(where: {$0.id == item.id}){
            viewModel.posts![indexToFav].isFavorite.toggle()
        }
    }
    
    func setRead(_ item: Post) {
        if let indexToFav = viewModel.posts?.firstIndex(where: {$0.id == item.id}){
            viewModel.posts![indexToFav].isRead.toggle()
        }
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
