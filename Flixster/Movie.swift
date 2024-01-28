//
//  Movie.swift
//  Flixster
//
//  Created by Michael Waller on 1/28/24.
//

import Foundation


struct Movie: Decodable {
    
    let title: String
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let poster: URL
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case overview = "overview"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case poster = "poster_path"
        
    }
    
    private enum NestedStructCodingKeys: String, CodingKey {
        case nestedAliasField = "nested_actual_field"
    }
    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        popularity = try container.decode(Double.self, forKey: .popularity)
        let posterBaseURL = URL(string: "https://image.tmdb.org/t/p/original")!
        let posterPath = try container.decode(String.self, forKey: .poster)
        poster = posterBaseURL.appendingPathComponent(posterPath)
    }
    
 
    
    
   
    
}

struct MovieResponse: Decodable {
    let results: [Movie]
}


