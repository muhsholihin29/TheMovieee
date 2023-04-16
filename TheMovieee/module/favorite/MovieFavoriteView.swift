//
//  MovieFavoriteView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Favorite
import CorePackage
import Movie
import Tv

struct MovieFavoriteView: View {
    @ObservedObject var presenter: GetFavoritePresenter<
        MovieDomainModel,
        TvDomainModel,
        FavoriteInteractor<
            MovieDomainModel,
            TvDomainModel,
            GetFavoritesRepository<
                GetFavoriteLocaleDataSource,
                FavoriteTransformer>>>

    var body: some View {
        VStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ActivityIndicator()
                }
            } else {
                List(presenter.favoriteMovies, id: \.id) { movie in
                    ZStack {
                        linkBuilder(for: movie) {
                            MovieFavoriteItemView(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    func linkBuilder<Content: View>(
        for movie: MovieDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: MovieRouter().makeDetailView(for: movie)) { content() }
    }
}
