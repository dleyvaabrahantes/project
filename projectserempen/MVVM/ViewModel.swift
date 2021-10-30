//
//  ViewModel.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var posts:[Post]? = []
    
    @Published var offset: Int = 0
    @Published var problem = ""
    
    @Published var usuario:[User]? = []
    
    init(){
        
        self.requestCode()
    }
    
    func requestCode() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        
     //   request.setValue("https://developer.marvel.com/", forHTTPHeaderField: "Referer")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data, response, error) in
            
            
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                print("Data not found")
                return
            }
            do{
                let postsElement = try JSONDecoder().decode([Post].self, from: jsonData)
                DispatchQueue.main.async {
                    self.posts = postsElement
                   // self.comics?.append(contentsOf: comics.data.results)
                }
                
            }catch{
                
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
    
    func requestCode(user: String){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users\(user)")!
        var request = URLRequest(url: url)
        
     //   request.setValue("https://developer.marvel.com/", forHTTPHeaderField: "Referer")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data, response, error) in
            
            
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                print("Data not found")
                return
            }
            do{
                let user = try JSONDecoder().decode([User].self, from: jsonData)
                DispatchQueue.main.async {
                    self.usuario = user
                   // self.comics?.append(contentsOf: comics.data.results)
                }
                
            }catch{
                
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
    
    //Create URL for WebImage object
    func extractImage(path: String, ext: String)-> URL{
        
        
        return URL(string: "\(path).\(ext)")!
    }
}
