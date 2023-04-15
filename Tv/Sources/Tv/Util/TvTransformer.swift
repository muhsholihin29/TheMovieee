//
//  File.swift
//  
//
//  Created by Sholi on 08/04/23.
//

import Core

public struct TvTransformer: TvMapper {
    
    public typealias Response = [TvResponse.Result]
    public typealias TvDomain = [TvDomainModel]
    public typealias DetailResponse = DetailTvResponse
    public typealias DetailDomain = DetailTvDomainModel
    
    public init() {}
 
    public func transformTvResponseToDomain(
        response: [TvResponse.Result]
    ) -> [TvDomainModel] {
        
        response.map { result in
            TvDomainModel(
                backdropPath: result.backdropPath ?? "",
                firstAirDate: result.firstAirDate ?? "",
                id: result.id,
                name: result.name ?? "",
                popularity: result.popularity ?? 0,
                posterPath: result.posterPath ?? "",
                voteAverage: result.voteAverage ?? 0,
                voteCount: result.voteCount ?? 0
            )
        }
    }
    
    public func transformDetailTvResponseToDomain(
        response detail: DetailTvResponse
    ) -> DetailTvDomainModel {
        DetailTvDomainModel(
            backdropPath: detail.backdropPath ?? "",
            firstAirDate: detail.firstAirDate ?? "",
            genres: detail.genres?.map { genre in
                DetailTvDomainModel.Genre(id: genre.id, name: genre.name)
            } ?? [],
            homepage: detail.homepage ?? "",
            id: detail.id,
            lastAirDate: detail.lastAirDate ?? "",
            name: detail.name ?? "",
            numberOfEpisodes: detail.numberOfEpisodes ?? 0,
            numberOfSeasons: detail.numberOfSeasons ?? 0,
            overview: detail.overview ?? "",
            popularity: detail.popularity ?? 0,
            posterPath: detail.posterPath ?? "",
            status: detail.status ?? "",
            tagline: detail.tagline ?? "",
            type: detail.type ?? "",
            voteAverage: detail.voteAverage ?? 0,
            voteCount: detail.voteCount ?? 0
        )
    }
}
