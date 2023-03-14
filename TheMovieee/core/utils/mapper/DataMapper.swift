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
        return movieResultResponse.map { result in
            return Movie(
                adult: result.adult ?? false,
                backdropPath: result.backdropPath ?? "",
                id: result.id,
                popularity: result.popularity ?? 0,
                posterPath: result.posterPath ?? "",
                releaseDate: result.releaseDate ?? "",
                title: result.title ?? "",
                video: result.video ?? false,
                voteAverage: result.voteAverage ?? 0,
                voteCount: result.voteCount ?? 0
            )
        }
    }
    
    static func mapTvResponseToDomain(
        input tvResultResponses: [TvResponse.Result]
    ) -> [Tv] {
        
        return tvResultResponses.map { result in
            return Tv(
                backdropPath: result.backdropPath ?? "",
                firstAirDate: result.firstAirDate ?? "",
                genreIDS: result.genreIDS ?? [Int](),
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
            adult: detail.adult ?? false,
            backdropPath: detail.backdropPath ?? "",
            budget: detail.budget ?? 0,
            genres: detail.genres?.map { genre in
                return DetailMovie.Genre(
                    id: genre.id,
                    name: genre.name
                )
            } ?? [],
            homepage: detail.homepage ?? "",
            id: detail.id,
            imdbID: detail.imdbID ?? "",
            originalLanguage: detail.originalLanguage ?? "",
            originalTitle: detail.originalTitle ?? "",
            overview: detail.overview ?? "",
            popularity: detail.popularity ?? 0,
            posterPath: detail.posterPath ?? "",
            productionCompanies: detail.productionCompanies?.map { company in
                return DetailMovie.ProductionCompany(
                    id: company.id,
                    logoPath: company.logoPath,
                    name: company.name,
                    originCountry: company.originCountry
                )
            } ?? [],
            productionCountries: detail.productionCountries?.map { country in
                return DetailMovie.ProductionCountry(
                    iso3166_1: country.iso3166_1,
                    name: country.name
                )
            } ?? [],
            releaseDate: detail.releaseDate ?? "",
            revenue: detail.revenue ?? 0,
            runtime: detail.runtime ?? 0,
            spokenLanguages: detail.spokenLanguages?.map { language in
                return DetailMovie.SpokenLanguage(
                    englishName: language.englishName,
                    iso639_1: language.iso639_1,
                    name: language.name
                )
            } ?? [],
            status: detail.status ?? "",
            tagline: detail.tagline ?? "",
            title: detail.title ?? "",
            video: detail.video ?? false,
            voteAverage: detail.voteAverage ?? 0,
            voteCount: detail.voteCount ?? 0
        )
    }
    
    static func mapDetailTvResponseToDomain(
        input detail: DetailTvResponse
    ) -> DetailTv {
        return DetailTv(
            backdropPath: detail.backdropPath ?? "",
            createdBy: detail.createdBy?.map { created in
                DetailTv.CreatedBy(
                    id: created.id,
                    creditID: created.creditID,
                    name: created.name,
                    gender: created.gender,
                    profilePath: created.profilePath
                )
            } ?? [],
            episodeRunTime: detail.episodeRunTime ?? [],
            firstAirDate: detail.firstAirDate ?? "",
            genres: detail.genres?.map { genre in
                DetailTv.Genre(id: genre.id, name: genre.name)
            } ?? [],
            homepage: detail.homepage ?? "",
            id: detail.id,
            inProduction: detail.inProduction ?? false,
            languages: detail.languages ?? [],
            lastAirDate: detail.lastAirDate ?? "",
            lastEpisodeToAir: DetailTv.EpisodeToAir(
                airDate: detail.lastEpisodeToAir?.airDate,
                episodeNumber: detail.lastEpisodeToAir?.episodeNumber,
                id: detail.lastEpisodeToAir?.id,
                name: detail.lastEpisodeToAir?.name,
                overview: detail.lastEpisodeToAir?.overview,
                productionCode: detail.lastEpisodeToAir?.productionCode,
                seasonNumber: detail.lastEpisodeToAir?.seasonNumber,
                stillPath: detail.lastEpisodeToAir?.stillPath,
                voteAverage: detail.lastEpisodeToAir?.voteAverage,
                voteCount: detail.lastEpisodeToAir?.voteCount
            ),
            name: detail.name ?? "",
            nextEpisodeToAir: DetailTv.EpisodeToAir(
                airDate: detail.nextEpisodeToAir?.airDate,
                episodeNumber: detail.nextEpisodeToAir?.episodeNumber,
                id: detail.nextEpisodeToAir?.id,
                name: detail.nextEpisodeToAir?.name,
                overview: detail.nextEpisodeToAir?.overview,
                productionCode: detail.nextEpisodeToAir?.productionCode,
                seasonNumber: detail.nextEpisodeToAir?.seasonNumber,
                stillPath: detail.nextEpisodeToAir?.stillPath,
                voteAverage: detail.nextEpisodeToAir?.voteAverage,
                voteCount: detail.nextEpisodeToAir?.voteCount
            ),
            networks: detail.networks?.map { network in
                DetailTv.Network(name: network.name, id: network.id, logoPath: network.logoPath, originCountry: network.originCountry)
            } ?? [],
            numberOfEpisodes: detail.numberOfEpisodes ?? 0,
            numberOfSeasons: detail.numberOfSeasons ?? 0,
            originCountry: detail.originCountry ?? [],
            originalLanguage: detail.originalLanguage ?? "",
            originalName: detail.originalName ?? "",
            overview: detail.overview ?? "",
            popularity: detail.popularity ?? 0,
            posterPath: detail.posterPath ?? "",
            productionCompanies: detail.productionCompanies?.map { company in
                DetailTv.ProductionCompany(name: company.name, id: company.id, logoPath: company.logoPath, originCountry: company.originCountry)
            } ?? [],
            productionCountries: detail.productionCountries?.map { country in
                DetailTv.ProductionCountry(iso3166_1: country.iso3166_1, name: country.name)
            } ?? [],
            seasons: detail.seasons?.map { season in
                return DetailTv.Season(
                    airDate: season.airDate,
                    episodeCount: season.episodeCount,
                    id: season.id,
                    name: season.name,
                    overview: season.overview,
                    posterPath: season.posterPath,
                    seasonNumber: season.seasonNumber
                )
            } ?? [],
            spokenLanguages: detail.spokenLanguages?.map { language in
                DetailTv.SpokenLanguage(englishName: language.englishName, iso639_1: language.iso639_1, name: language.name)
            } ?? [],
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
        return Movie(
            adult: false,
            backdropPath: "",
            id: result.movieId,
            popularity: 0,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            video: false,
            voteAverage: result.voteAverage,
            voteCount: 0
        )
    }
    
    static func mapFavoriteTvEntityToDomain(
        input result: FavoriteTvEntity
    ) -> Tv {
        return Tv(
            backdropPath: "",
            firstAirDate: "",
            genreIDS: Array(result.genreIDS),
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
        entity.genreIDS.append(objectsIn: result.genreIDS)
        entity.tvId = result.id
        entity.name = result.name
        entity.posterPath = result.posterPath
        entity.voteAverage = result.voteAverage
        return entity
    }
}
