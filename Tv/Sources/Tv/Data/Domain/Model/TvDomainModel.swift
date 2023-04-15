//
//  File.swift
//  
//
//  Created by Sholi on 08/04/23.
//

import Foundation

public struct TvDomainModel: Equatable, Identifiable {
    public let backdropPath: String
    public let firstAirDate: String
    public let id: Int
    public let name: String
    public let popularity: Double
    public let posterPath: String
    public let voteAverage: Double
    public let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case id, name
        case popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(backdropPath: String, firstAirDate: String, id: Int, name: String, popularity: Double, posterPath: String, voteAverage: Double, voteCount: Int) {
        self.backdropPath = backdropPath
        self.firstAirDate = firstAirDate
        self.id = id
        self.name = name
        self.popularity = popularity
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
