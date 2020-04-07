//
//  Movie.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 4/6/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI


class Movie : ObservableObject {

    @Published var movies = [MovieModel]()
    private let baseUrl = "http://localhost:3000/movies"
     
    public func fetchMovies(){
        AF.request(baseUrl, method: .get, encoding: Alamofire.JSONEncoding.default).responseJSON {
            response in
            
            do {
                if response.data != nil {
                    let result = try JSONDecoder().decode([MovieModel].self, from: response.data!)
                    
                    self.movies = result
                }
            } catch {
                print(error)
            }

        }
    }
    
}
