//
//  DetailTvResponse.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailTvResponse: Decodable {
    let backdropPath: String?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int
    let inProduction: Bool?
    let lastAirDate: String?
    let name: String?
    let numberOfEpisodes, numberOfSeasons: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let status, tagline, type: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genres, homepage, id
        case inProduction = "in_production"
        case lastAirDate = "last_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview, popularity
        case posterPath = "poster_path"
        case status, tagline, type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    struct Genre: Decodable {
        let id: Int?
        let name: String?
    }
}
