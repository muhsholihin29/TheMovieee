//
//  TheMovieeeApp.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Movie
import Tv
import CorePackage
import Favorite

let movieUseCase: MovieInteractor<
    MovieDomainModel,
    DetailMovieDomainModel,
    GetMoviesRepository<
        GetMoviesRemoteDataSource,
        MovieTransformer>,
    GetFavoritesRepository<
        GetFavoriteLocaleDataSource,
        FavoriteTransformer>
> = Injection.init().provideMovie()

let tvUseCase: TvInteractor<
    TvDomainModel,
    DetailTvDomainModel,
    GetTvsRepository<
        GetTvsRemoteDataSource,
        TvTransformer>,
    GetFavoritesRepository<
        GetFavoriteLocaleDataSource,
        FavoriteTransformer>
> = Injection.init().provideTv()

let favoriteUseCase: FavoriteInteractor<
    MovieDomainModel,
    TvDomainModel,
    GetFavoritesRepository<
        GetFavoriteLocaleDataSource,
        FavoriteTransformer>
> = Injection.init().provideFavorite()

@main
struct TheMovieeeApp: App {
    var body: some Scene {
        
        let moviePresenter = GetMoviePresenter(useCase: movieUseCase)
        let tvPresenter = GetTvPresenter(tvUseCase: tvUseCase)
        let favoritePresenter = GetFavoritePresenter(favoriteUseCase: favoriteUseCase)
        
        WindowGroup {
            ContentView()
                    .environmentObject(moviePresenter)
                    .environmentObject(tvPresenter)
                    .environmentObject(favoritePresenter)
        }
    }
}
