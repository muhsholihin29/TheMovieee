//
//  TvResponse.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct TvResponse: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
        // MARK: - Result
    struct Result: Codable {
        let backdropPath: String?
        let firstAirDate: String?
        let id: Int
        let name: String?
        let overview: String?
        let popularity: Double?
        let posterPath: String?
        let voteAverage: Double?
        let voteCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case backdropPath = "backdrop_path"
            case firstAirDate = "first_air_date"
            case id, name
            case overview, popularity
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}
