//
//  File.swift
//  
//
//  Created by Sholi on 08/04/23.
//

import Core

public struct MovieTransformer: MovieMapper {
    
    public typealias Response = [MovieResponse.Result]
    public typealias MovieDomain = [MovieDomainModel]
    public typealias DetailResponse = DetailMovieResponse
    public typealias DetailDomain = DetailMovieDomainModel
    
    public init() {}
    
    public func transformMovieResponseToDomain(response: [MovieResponse.Result]) -> [MovieDomainModel] {
        return response.map { result in
            MovieDomainModel(
                backdropPath: result.backdropPath ?? "",
                id: result.id,
                popularity: result.popularity ?? 0,
                posterPath: result.posterPath ?? "",
                releaseDate: result.releaseDate ?? "",
                title: result.title ?? "",
                voteAverage: result.voteAverage ?? 0,
                voteCount: result.voteCount ?? 0
            )
        }
    }
    
    public func transformDetailMovieResponseToDomain(response detail: DetailMovieResponse) -> DetailMovieDomainModel {
        return DetailMovieDomainModel(
            backdropPath: detail.backdropPath ?? "",
            budget: detail.budget ?? 0,
            genres: detail.genres?.map { genre in
                DetailMovieDomainModel.Genre(
                    id: genre.id,
                    name: genre.name
                )
            } ?? [],
            homepage: detail.homepage ?? "",
            id: detail.id,
            overview: detail.overview ?? "",
            popularity: detail.popularity ?? 0,
            posterPath: detail.posterPath ?? "",
            releaseDate: detail.releaseDate ?? "",
            revenue: detail.revenue ?? 0,
            runtime: detail.runtime ?? 0,
            status: detail.status ?? "",
            tagline: detail.tagline ?? "",
            title: detail.title ?? "",
            voteAverage: detail.voteAverage ?? 0,
            voteCount: detail.voteCount ?? 0
        )
    }
}
