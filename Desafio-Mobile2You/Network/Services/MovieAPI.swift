//
//  MovieAPI.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 21/09/21.
//

import Moya

enum MovieAPI {
    case getDetails(id: String)
    case getSimilarMovies(id: String)
}

extension MovieAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .getDetails(let id):
            return "/movie/\(id)"
        case .getSimilarMovies(let id):
            return "/movie/\(id)/similar"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        return .requestParameters(parameters: ["api_key" : "51fd96e1f416e7801414bee5ee048295"],
                                  encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
