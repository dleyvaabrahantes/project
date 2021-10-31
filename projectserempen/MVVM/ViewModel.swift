//
//  ViewModel.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var posts:[Post]? = []
    @Published var usuarios: User? = nil
    
    init(){
        self.requestCode()
    }
    
    
    func requestCode() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
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
    
    func requestUserDetail(_ userId: Int){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)")!
        let request = URLRequest(url: url)
        
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
                let user = try JSONDecoder().decode(User.self, from: jsonData)
                DispatchQueue.main.async {
                    
                    self.usuarios = user
                }
                
            }catch{
                
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
}
