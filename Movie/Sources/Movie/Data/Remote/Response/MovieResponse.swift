//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

public struct MovieResponse: Decodable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    public struct Result: Decodable {
        let backdropPath: String?
        let id: Int
        let overview: String?
        let popularity: Double?
        let posterPath, releaseDate, title: String?
        let voteAverage: Double?
        let voteCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case backdropPath = "backdrop_path"
            case id
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}
