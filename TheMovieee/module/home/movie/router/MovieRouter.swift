//
//  MovieRouter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Movie
import CorePackage
import Favorite

class MovieRouter {
    func makeDetailView(for movie: MovieDomainModel) -> some View {
        let detailUseCase: MovieInteractor<
            MovieDomainModel,
            DetailMovieDomainModel,
            GetMoviesRepository<
                GetMoviesRemoteDataSource,
                MovieTransformer>,
            GetFavoritesRepository<
                GetFavoriteLocaleDataSource,
                FavoriteTransformer>
        > = Injection.init().provideMovie()
        let presenter = GetMovieDetailPresenter(detailUseCase: detailUseCase)
        return MovieDetailView(movie: movie, presenter: presenter)
    }
}
