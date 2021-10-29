//
//  model.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//


//"userId": 1,
//    "id": 1,
//    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//  },
//  {
import Foundation


struct Post: Codable{
    var userId : Int
    var id : Int
    var title: String
    var body: String
}
