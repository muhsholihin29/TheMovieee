//
//  MovieListView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Tv
import CorePackage
import Favorite
import Movie

struct MovieListView: View {
    @ObservedObject var presenter: GetMoviePresenter<
        MovieDomainModel,
        DetailMovieDomainModel,
        MovieInteractor<
            MovieDomainModel,
            DetailMovieDomainModel,
            GetMoviesRepository<
                GetMoviesRemoteDataSource,
                MovieTransformer>,
            GetFavoritesRepository<
                GetFavoriteLocaleDataSource,
                FavoriteTransformer>>>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    Text("Popular Movies")
                    if presenter.popularLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(self.presenter.popularMovies, id: \.id) { movie in
                                    item(movie: movie)
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.popularMovies.count == 0 {
                        self.presenter.getPopularMovies()
                    }
                }
                
                VStack {
                    Text("Top Rated Movies")
                    if presenter.topRatedLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(self.presenter.topRatedMovies, id: \.id) { movie in
                                    item(movie: movie)
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.topRatedMovies.count == 0 {
                        self.presenter.getTopRatedMovies()
                    }
                }
                
                VStack {
                    Text("Now Plasing Movies")
                    if presenter.nowPlayingLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(self.presenter.nowPlayingMovies, id: \.id) { movie in
                                    item(movie: movie)
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.nowPlayingMovies.count == 0 {
                        self.presenter.getNowPlayingMovies()
                    }
                }
                
                
                VStack {
                    Text("Upcoming Movie")
                    if presenter.upcomingLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(self.presenter.upcomingMovies, id: \.id) { movie in
                                    item(movie: movie)
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.upcomingMovies.count == 0 {
                        self.presenter.getUpcomingMovies()
                    }
                }
            
            }
        }.navigationBarTitle(
                        Text("TheMovieee"),
                        displayMode: .automatic
                )
    }
    
    func item(movie: MovieDomainModel) -> some View {
        ZStack {
            linkBuilder(for: movie) {
                MovieItemView(movie: movie)
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    func linkBuilder<Content: View>(
        for movie: MovieDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: MovieRouter().makeDetailView(for: movie)) {
                content()
            }
    }
}

