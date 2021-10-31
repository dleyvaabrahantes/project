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
import MapKit


// MARK: - Post
struct Post: Decodable{
    
    var userId : Int
    var id : Int
    var title: String
    var body: String
    
    var isFavorite: Bool
    var isRead: Bool
    
    
    enum CodingKeys: String, CodingKey {
        
        case userId,id, title, body, isFavorite, isRead
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false
        self.isRead = try container.decodeIfPresent(Bool.self, forKey: .isRead) ?? true
    }
    
    
    
    
}



// MARK: - User
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: Double(address.geo.lat)!, longitude: Double(address.geo.lng)!)
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
