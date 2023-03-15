//
//  TheMovieeeApp.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

@main
struct TheMovieeeApp: App {
    var body: some Scene {
        
        let injection = Injection.init()
        let movieUseCase = injection.provideMovie()
        let tvUseCase = injection.provideTv()
        let favoriteUseCase = injection.provideFavorite()
        let moviePresenter = MoviePresenter(movieUseCase: movieUseCase)
        let tvPresenter = TvPresenter(tvUseCase: tvUseCase)
        let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        
        WindowGroup {
            ContentView()
                    .environmentObject(moviePresenter)
                    .environmentObject(tvPresenter)
                    .environmentObject(favoritePresenter)
        }
    }
}
