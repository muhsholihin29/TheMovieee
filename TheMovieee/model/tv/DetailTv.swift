//
//  DetailTv.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailTv: Equatable, Identifiable {
    let backdropPath: String
    let createdBy: [CreatedBy]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: EpisodeToAir?
    let name: String
    let nextEpisodeToAir: EpisodeToAir?
    let networks: [Network]
    let numberOfEpisodes, numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let seasons: [Season]
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, type: String
    let voteAverage: Double
    let voteCount: Int
    
        // MARK: - CreatedBy
    struct CreatedBy: Equatable {
        let id: Int?
        let creditID, name: String?
        let gender: Int?
        let profilePath: String?
    }
    
        // MARK: - Genre
    struct Genre: Equatable {
        let id: Int?
        let name: String?
    }
    
        // MARK: - TEpisodeToAir
    struct EpisodeToAir: Equatable {
        let airDate: String?
        let episodeNumber, id: Int?
        let name, overview, productionCode: String?
        let seasonNumber: Int?
        let stillPath: String?
        let voteAverage, voteCount: Double?
    }
    
        // MARK: - Network
    struct Network: Equatable {
        let name: String?
        let id: Int?
        let logoPath: String?
        let originCountry: String?
    }
    
    struct ProductionCompany: Equatable {
        let name: String?
        let id: Int?
        let logoPath: String?
        let originCountry: String?
    }
    
        // MARK: - ProductionCountry
    struct ProductionCountry: Equatable {
        let iso3166_1, name: String?
    }
    
        // MARK: - Season
    struct Season: Equatable {
        let airDate: String?
        let episodeCount, id: Int?
        let name, overview: String?
        let posterPath: String?
        let seasonNumber: Int?
    }
    
        // MARK: - SpokenLanguage
    struct SpokenLanguage: Equatable {
        let englishName, iso639_1, name: String?
    }
}
