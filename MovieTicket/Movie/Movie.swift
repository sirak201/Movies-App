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



class Movie {
    var movies = [MovieModel]()
    private let baseUrl = "http://localhost:3000/movies"
     
    public func fetchMovies(handler: @escaping (Result<Int, Error>) -> Void){
        
        AF.request(baseUrl, method: .get, encoding: Alamofire.JSONEncoding.default).responseJSON {
            response in
            
            handler(.success(1))
            do {
                let result = try JSONDecoder().decode([MovieModel].self, from: response.data!)
                print(result)
            } catch {
                print(error)
            }
//            heroes = result.devices
//            let sameEmployee = try JSONDecoder().decode([Movie.self], from: response!.data)
        }
        
    }
    
}
