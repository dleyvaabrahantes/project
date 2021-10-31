//
//  ContentView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI
import Network

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showFavoriteOnly = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAlert = false
    let monitor = NWPathMonitor()

    
    @FetchRequest(
        entity: PostEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \PostEntity.id, ascending: true),
            
        ]
    ) var arrayEntity: FetchedResults<PostEntity>
    
    
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
                            
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
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
                                .tint(.yellow)
                                
                                Button(role: .destructive) {
                                    deleteObj(item)
                                } label: {
                                    Label("Eliminar", systemImage: "trash.fill")
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    setRead(item)
                                } label: {
                                    Label("leido", systemImage: "exclamationmark.circle")
                                }
                                .tint(.blue)
                                
                                
                            }
                        }
                        
                        
                    }
//                    .onAppear{
//                        checkInternet()
//                    }
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
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {saveArray()}){
                                Image(systemName: "square.and.arrow.down")
                            }.alert("Saved data Room", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
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
    
    func checkInternet(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                print("No connection.")
            }

            print(path.isExpensive)
        }
    }
    
    func saveArray(){
        
        for item in viewModel.posts! {
            let post = PostEntity(context: managedObjectContext)
            post.setValue(item.id, forKey: "id")
            post.setValue(item.userId, forKey: "userId")
            post.setValue(item.title, forKey: "title")
            post.setValue(item.body, forKey: "body")
            post.setValue(item.isRead, forKey: "isRead")
            post.setValue(item.isFavorite, forKey: "isFavorite")
            
        }
        do {
            try managedObjectContext.save()
            print("Succes")
            showingAlert = true
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

