//
//  Movie.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct Movie: Equatable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
