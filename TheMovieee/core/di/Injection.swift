//
//  Injection.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift
import CorePackage
import Favorite
import Movie
import Tv
import SwiftUI

final class Injection: NSObject {
    
    private let realm = try? Realm()

    func provideMovie<U: MovieUseCase>() -> U where U.MovieModel == MovieDomainModel, U.DetailMovieModel == DetailMovieDomainModel {
        let remote = GetMoviesRemoteDataSource()
        let local = GetFavoriteLocaleDataSource(realm: realm!)
        let mapper = MovieTransformer()
        let favoriteMapper = FavoriteTransformer()
        let repository = GetMoviesRepository(remoteDataSource: remote, mapper: mapper)
        let favoriteRepository = GetFavoritesRepository(localeDataSource: local, mapper: favoriteMapper)
        return MovieInteractor(movieRepository: repository, favoriteRepository: favoriteRepository ) as! U
    }

    func provideTv<U: TvUseCase>() -> U where U.TvModel == TvDomainModel, U.DetailTvModel == DetailTvDomainModel {
        let remote = GetTvsRemoteDataSource()
        let local = GetFavoriteLocaleDataSource(realm: realm!)
        let mapper = TvTransformer()
        let favoriteMapper = FavoriteTransformer()
        let repository = GetTvsRepository(remoteDataSource: remote, mapper: mapper)
        let favoriteRepository = GetFavoritesRepository(localeDataSource: local, mapper: favoriteMapper)
        return TvInteractor(tvRepository: repository, favoriteRepository: favoriteRepository) as! U
    }

    func provideFavorite<U: FavoriteUseCase>() -> U where U.MovieModel == MovieDomainModel, U.TvModel == TvDomainModel {
        let local = GetFavoriteLocaleDataSource(realm: realm!)
        let mapper = FavoriteTransformer()
        let repository = GetFavoritesRepository(localeDataSource: local, mapper: mapper)
        return FavoriteInteractor<MovieDomainModel, TvDomainModel, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>(repository: repository) as! U
    }
}
