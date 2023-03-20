//
//  DataMapper.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift

final class DataMapper {
    
    static func mapMovieResponseToDomain(
        input movieResultResponse: [MovieResponse.Result]
    ) -> [Movie] {
        movieResultResponse.map { result in
            Movie(
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
    
    static func mapTvResponseToDomain(
        input tvResultResponses: [TvResponse.Result]
    ) -> [Tv] {

        tvResultResponses.map { result in
            Tv(
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
    
    static func mapDetailMovieResponseToDomain(
        input detail: DetailMovieResponse
    ) -> DetailMovie {
        return DetailMovie(
            backdropPath: detail.backdropPath ?? "",
            budget: detail.budget ?? 0,
            genres: detail.genres?.map { genre in
                DetailMovie.Genre(
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
    
    static func mapDetailTvResponseToDomain(
        input detail: DetailTvResponse
    ) -> DetailTv {
        DetailTv(
                backdropPath: detail.backdropPath ?? "",
                firstAirDate: detail.firstAirDate ?? "",
                genres: detail.genres?.map { genre in
                    DetailTv.Genre(id: genre.id, name: genre.name)
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

    static func mapFavoriteMovieEntityToDomain(
        input result: FavoriteMovieEntity
    ) -> Movie {
        Movie(
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
    
    static func mapFavoriteTvEntityToDomain(
        input result: FavoriteTvEntity
    ) -> Tv {
        Tv(
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
    
    static func mapMovieToFavoriteEntity(
        input result: Movie
    ) -> FavoriteMovieEntity {
        let entity = FavoriteMovieEntity()
        entity.movieId = result.id
        entity.posterPath = result.posterPath
        entity.releaseDate = result.releaseDate
        entity.title = result.title
        entity.voteAverage = result.voteAverage
        return entity
    }
    
    static func mapTvToFavoriteEntity(
        input result: Tv
    ) -> FavoriteTvEntity {
        let entity = FavoriteTvEntity()
        entity.tvId = result.id
        entity.name = result.name
        entity.posterPath = result.posterPath
        entity.voteAverage = result.voteAverage
        return entity
    }
}
