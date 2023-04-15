//
//  DetailMovieResponse.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

public struct DetailMovieResponse: Decodable {
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public struct Genre: Decodable {
        let id: Int
        let name: String?
        enum CodingKeys: String, CodingKey {
            case id, name
        }
    }
}
