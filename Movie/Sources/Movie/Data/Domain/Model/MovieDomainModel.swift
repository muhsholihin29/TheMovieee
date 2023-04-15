//
//  File.swift
//  
//
//  Created by Sholi on 08/04/23.
//

public struct MovieDomainModel: Equatable, Identifiable {
    public let backdropPath: String
    public let id: Int
    public let popularity: Double
    public let posterPath: String
    public let releaseDate: String
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(backdropPath: String, id: Int, popularity: Double, posterPath: String, releaseDate: String, title: String, voteAverage: Double, voteCount: Int) {
        self.backdropPath = backdropPath
        self.id = id
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
