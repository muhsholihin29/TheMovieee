//
//  DetailTvResponse.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct DetailTvResponse: Decodable {
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: TEpisodeToAir?
    let name: String?
    let nextEpisodeToAir: TEpisodeToAir?
    let networks: [Network]?
    let numberOfEpisodes, numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, type: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres, homepage, id
        case inProduction = "in_production"
        case languages
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name
        case nextEpisodeToAir = "next_episode_to_air"
        case networks
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons
        case spokenLanguages = "spoken_languages"
        case status, tagline, type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
        // MARK: - CreatedBy
    struct CreatedBy: Decodable {
        let id: Int?
        let creditID, name: String?
        let gender: Int?
        let profilePath: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case creditID = "credit_id"
            case name, gender
            case profilePath = "profile_path"
        }
    }
    
        // MARK: - Genre
    struct Genre: Decodable {
        let id: Int?
        let name: String?
    }
    
        // MARK: - TEpisodeToAir
    struct TEpisodeToAir: Decodable {
        let airDate: String?
        let episodeNumber, id: Int?
        let name, overview, productionCode: String?
        let seasonNumber: Int?
        let stillPath: String?
        let voteAverage, voteCount: Double?
        
        enum CodingKeys: String, CodingKey {
            case airDate = "air_date"
            case episodeNumber = "episode_number"
            case id, name, overview
            case productionCode = "production_code"
            case seasonNumber = "season_number"
            case stillPath = "still_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
    
        // MARK: - Network
    struct Network: Decodable {
        let name: String?
        let id: Int?
        let logoPath: String?
        let originCountry: String?
        
        enum CodingKeys: String, CodingKey {
            case name, id
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
    }
    
    
    struct ProductionCompany: Decodable {
        let name: String?
        let id: Int?
        let logoPath: String?
        let originCountry: String?
        
        enum CodingKeys: String, CodingKey {
            case name, id
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
    }
    
        // MARK: - ProductionCountry
    struct ProductionCountry: Decodable {
        let iso3166_1, name: String?
        
        enum CodingKeys: String, CodingKey {
            case iso3166_1 = "iso_3166_1"
            case name
        }
    }
    
        // MARK: - Season
    struct Season: Decodable {
        let airDate: String?
        let episodeCount, id: Int?
        let name, overview: String?
        let posterPath: String?
        let seasonNumber: Int?
        
        enum CodingKeys: String, CodingKey {
            case airDate = "air_date"
            case episodeCount = "episode_count"
            case id, name, overview
            case posterPath = "poster_path"
            case seasonNumber = "season_number"
        }
    }
    
        // MARK: - SpokenLanguage
    struct SpokenLanguage: Decodable {
        let englishName, iso639_1, name: String?
        
        enum CodingKeys: String, CodingKey {
            case englishName = "english_name"
            case iso639_1 = "iso_639_1"
            case name
        }
    }
}
