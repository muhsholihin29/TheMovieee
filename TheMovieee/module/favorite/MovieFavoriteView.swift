//
//  MovieFavoriteView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct MovieFavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter

    var body: some View {
        VStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ActivityIndicator()
                }
            } else {
                List(presenter.favoriteMovies, id: \.id) { movie in
                    VStack {
                        self.presenter.linkBuilderMovie(for: movie) {
                                    MovieFavoriteItemView(movie: movie)
                                }
                                .buttonStyle(PlainButtonStyle())

                    }
                }
            }
        }
    }
}
