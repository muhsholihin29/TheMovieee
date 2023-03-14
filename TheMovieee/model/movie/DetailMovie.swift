//
//  DetailMovie.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailMovie: Equatable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    struct Genre: Equatable {
        let id: Int
        let name: String?
    }
    
    struct ProductionCompany: Equatable {
        let id: Int
        let logoPath, name, originCountry: String?
    }
    
    struct ProductionCountry: Equatable {
        let iso3166_1, name: String?
    }
    
    struct SpokenLanguage: Equatable {
        let englishName, iso639_1, name: String?
    }
}
