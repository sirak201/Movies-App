//
//  MovieModel.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 4/6/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation
import UIKit


struct MovieModel : Decodable{
//    var id : String
    var imageUrl : String
    var title : String
    var amh_title : String
//    var amh_cathagory : String
    var catagery : String
    var actors : String
    var price : Double
    var realeaseDate : String
    var description : String
   
    
    init(data : [String : Any]) {
        var word = ""

//        self.id = data["_id"] as? String ?? UUID().uuidString
        self.title = data["title"] as? String ?? "N/A"
        self.amh_title = data["amh_title"] as? String ?? "N/A"
        
        let catageries = data["catagery"] as? [String] ?? [String]()
        catageries.forEach {
            catagery in
            word += ", \(catagery)"
        }
        
        
        self.catagery = word
        word = ""
        self.imageUrl = data["imageUrl"] as? String ?? ""

//        self.amh_cathagory = "ኣችቲኦን , ኣድቨንሸረ , ፊኪር"
        
        let actors = data["actors"] as? [String] ?? [String]()
        actors.forEach {
            actor in
            word += ", \(actor)"
        }
        self.actors = word
        word = ""
        self.price = data["price"] as? Double ?? 14.99
        self.realeaseDate = data["realeaseDate"] as? String ?? "-/-/-"
        self.description = data["description"] as? String ?? ""
    }
}


