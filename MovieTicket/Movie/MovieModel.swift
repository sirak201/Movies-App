//
//  MovieModel.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 4/6/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation
import UIKit


struct MovieModel : Decodable ,Hashable {
    var id : String
    var imageUrl : String
    var title : String
    var amh_title : String
    var amh_category : [String]
    var category : [String]
    var actors : [String]
    var price : Double
    var realeaseDate : String
    var description : String
    
    enum CodingKeys: String, CodingKey {
        
          case  imageUrl , category , actors , price ,
                realeaseDate , description , title,
                amh_title , amh_category 
          case id = "_id"
       }
   
    
    init(data : [String : Any]) {
        self.id = data["_id"] as? String ?? UUID().uuidString
        self.title = data["title"] as? String ?? "N/A"
        self.amh_title = data["amh_title"] as? String ?? "N/A"
        self.category = data["category"] as? [String] ?? [String]()
        self.imageUrl = data["imageUrl"] as? String ?? ""
        self.actors = data["actors"] as? [String] ?? [String]()
        self.price = data["price"] as? Double ?? 14.99
        self.realeaseDate = data["realeaseDate"] as? String ?? "-/-/-"
        self.description = data["description"] as? String ?? ""
        self.amh_category = data["amh_catagory"] as? [String] ?? [String]()
    }
    
    public func categoryToString() -> String {
        var categories = ""
        
        category.forEach { category in
            categories += ", \(category)"
        }
        
        return categories
    }
    
    public func actorToString() -> String {
        var categories = ""
        
        category.forEach { category in
            categories += ", \(category)"
        }
        
        return categories
    }
    
    
}


