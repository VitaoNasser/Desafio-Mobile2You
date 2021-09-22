//
//  Movie.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 21/09/21.
//

struct Movie: Codable {
    let title: String
    let posterPath: String
    let releaseDate: String
    let popularity: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case popularity = "popularity"
        case voteCount = "vote_count"
    }
    
}



