//
//  FavoriteListView.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import SwiftUI
import CorePackage
import Favorite
import Movie
import Tv

struct FavoriteListView: View {
    @ObservedObject var presenter: GetFavoritePresenter<MovieDomainModel, TvDomainModel, FavoriteInteractor<MovieDomainModel, TvDomainModel, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>>

    @State private var selectedTab: Int = 0
    let tabs: [Tab] = [
        .init(icon: Image(systemName: "film.circle"), title: "Movie"),
        .init(icon: Image(systemName: "tv.circle"), title: "Tv"),
    ]

    var body: some View {
        VStack {
            GeometryReader { geo in

                VStack(spacing: 0) {
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                    TabView(selection: $selectedTab,
                            content: {
                                MovieFavoriteView(presenter: presenter)
                                        .tag(0)
                                TvFavoriteView(presenter: presenter)
                                        .tag(1)
                            })
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                }
            }
        }
                .onAppear {
                    presenter.getFavoriteMovies()
                    presenter.getFavoriteTvs()
                }

    }
    
}

