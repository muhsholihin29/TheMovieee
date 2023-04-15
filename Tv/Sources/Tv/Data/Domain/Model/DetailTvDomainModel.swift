//
//  DetailTv.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

public struct DetailTvDomainModel: Equatable, Identifiable {
    public let backdropPath: String
    public let firstAirDate: String
    public let genres: [Genre]
    public let homepage: String
    public let id: Int
    public let lastAirDate: String
    public let name: String
    public let numberOfEpisodes, numberOfSeasons: Int
    public let overview: String
    public let popularity: Double
    public let posterPath: String
    public let status, tagline, type: String
    public let voteAverage: Double
    public let voteCount: Int

    public struct Genre: Equatable {
        let id: Int?
        let name: String?
    }
}
