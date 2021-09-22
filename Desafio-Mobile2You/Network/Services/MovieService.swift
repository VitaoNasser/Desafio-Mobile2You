//
//  MovieService.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 21/09/21.
//

import Foundation
import Moya

class MovieService {
    
    let provider = MoyaProvider<MovieAPI>()
    
    func fetchMovieDetails(id: String, completion: @escaping (Movie) -> Void) {
        provider.request(.getDetails(id: id)) { (result) in
            switch result {
            
            case .success(let response):
                do {
                    let movie = try response.map(Movie.self)
                    completion(movie)
                } catch {
                    print("parse error")
                }
                
            case .failure(_):
                print("network error")
            }
        }
    }
    
    func fetchSimilarMovies(id: String, completion: @escaping ([Movie]) -> Void) {
        provider.request(.getSimilarMovies(id: id)) { (result) in
            switch result {
            
            case .success(let response):
                do {
                    let similar = try response.map(SimilarMovies.self)
                    completion(similar.results)
                } catch {
                    print("parse error")
                }
                
            case .failure(_):
                print("network error")
            }
        }
    }
}
