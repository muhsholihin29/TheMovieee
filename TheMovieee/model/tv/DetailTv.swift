//
//  DetailTv.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailTv: Equatable, Identifiable {
    let backdropPath: String
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let lastAirDate: String
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let status, tagline, type: String
    let voteAverage: Double
    let voteCount: Int

    struct Genre: Equatable {
        let id: Int?
        let name: String?
    }
}
