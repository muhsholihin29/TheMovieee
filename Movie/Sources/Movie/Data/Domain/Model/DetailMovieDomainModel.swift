//
//  DetailMovie.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

public struct DetailMovieDomainModel: Equatable, Identifiable {
    public let backdropPath: String
    public let budget: Int
    public let genres: [Genre]
    public let homepage: String
    public let id: Int
    public let overview: String
    public let popularity: Double
    public let posterPath: String
    public let releaseDate: String
    public let revenue, runtime: Int
    public let status, tagline, title: String
    public let voteAverage: Double
    public let voteCount: Int
    
    public struct Genre: Equatable {
        let id: Int
        let name: String?
    }
}
