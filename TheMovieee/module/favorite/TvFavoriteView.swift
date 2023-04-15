//
//  TvFavoriteView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Tv
import Movie
import Core
import Favorite

struct TvFavoriteView: View {
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
                List(presenter.favoriteTvs, id: \.id) { tv in
                    ZStack {
                        linkBuilder(for: tv) {
                            TvItemView(tv: tv)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    func linkBuilder<Content: View>(
        for tv: TvDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: TvRouter().makeDetailView(for: tv)) { content() }
    }
}
