//
//  Tv.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct Tv: Equatable, Identifiable {
    let backdropPath: String
    let firstAirDate: String
    let id: Int
    let name: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case id, name
        case popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
