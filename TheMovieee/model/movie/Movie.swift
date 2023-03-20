//
//  Movie.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

struct Movie: Equatable, Identifiable {
    let backdropPath: String
    let id: Int
    let popularity: Double
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int
}
