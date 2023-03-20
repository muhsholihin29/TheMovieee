//
//  DetailMovie.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailMovie: Equatable, Identifiable {
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let voteAverage: Double
    let voteCount: Int
    
    struct Genre: Equatable {
        let id: Int
        let name: String?
    }
}
