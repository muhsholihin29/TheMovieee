//
//  ContentView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Core
import Movie
import Favorite
import Tv

struct ContentView: View {
    @EnvironmentObject var moviePresenter: GetMoviePresenter<MovieDomainModel, DetailMovieDomainModel, MovieInteractor<MovieDomainModel, DetailMovieDomainModel, GetMoviesRepository<GetMoviesRemoteDataSource, MovieTransformer>, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>>
    @EnvironmentObject var tvPresenter: GetTvPresenter<TvDomainModel, DetailTvDomainModel, TvInteractor<TvDomainModel, DetailTvDomainModel, GetTvsRepository<GetTvsRemoteDataSource, TvTransformer>, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>>
    @EnvironmentObject var favoritePresenter: GetFavoritePresenter<MovieDomainModel, TvDomainModel, FavoriteInteractor<MovieDomainModel, TvDomainModel, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>>
    
    var body: some View {
        NavigationView {
            TabView {
                MovieListView(presenter: moviePresenter)
                        .tabItem {
                            Image(systemName: "film.fill")
                            Text("Game")
                        }
                TvListView(presenter: tvPresenter)
                        .tabItem {
                            Image(systemName: "tv.fill")
                            Text("Tv")
                        }
                FavoriteListView(presenter: favoritePresenter)
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favorite")
                        }
                ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }

            }
            .navigationBarTitle(Text("TheMovieee"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
