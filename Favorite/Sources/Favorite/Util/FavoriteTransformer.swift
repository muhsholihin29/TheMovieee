//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import Foundation
import CorePackage
import Movie
import Tv

public struct FavoriteTransformer: FavoriteMapper {
    
    public typealias MovieEntity = FavoriteMovieModuleEntity
    public typealias MovieDomain = MovieDomainModel
    public typealias TvEntity = FavoriteTvModuleEntity
    public typealias TvDomain = TvDomainModel
    
    public init() {}
    
    public func transformMovieEntityToDomain(
        entity result: FavoriteMovieModuleEntity
    ) -> MovieDomainModel {
        MovieDomainModel(
            backdropPath: "",
            id: result.movieId,
            popularity: 0,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            voteAverage: result.voteAverage,
            voteCount: 0
        )
    }
    
    public func transformTvEntityToDomain(
        entity result: FavoriteTvModuleEntity
    ) -> TvDomainModel {
        TvDomainModel(
            backdropPath: "",
            firstAirDate: "",
            id: result.tvId,
            name: result.name,
            popularity: 0,
            posterPath: result.posterPath,
            voteAverage: result.voteAverage,
            voteCount: 0
        )
    }
    
    public func transformMovieDomainToEntity(
        domain result: MovieDomainModel
    ) -> FavoriteMovieModuleEntity {
        let entity = FavoriteMovieModuleEntity()
        entity.movieId = result.id
        entity.posterPath = result.posterPath
        entity.releaseDate = result.releaseDate
        entity.title = result.title
        entity.voteAverage = result.voteAverage
        return entity
    }
    
    public func transformTvDomainToEntity(
        domain result: TvDomainModel
    ) -> FavoriteTvModuleEntity {
        let entity = FavoriteTvModuleEntity()
        entity.tvId = result.id
        entity.name = result.name
        entity.posterPath = result.posterPath
        entity.voteAverage = result.voteAverage
        return entity
    }
}
