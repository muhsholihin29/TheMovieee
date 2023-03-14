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
        let moviePresenter = MoviePresenter(movieUseCase: movieUseCase)
        let tvPresenter = TvPresenter(tvUseCase: tvUseCase)
        
        
        
        WindowGroup {
            ContentView()
                .environmentObject(moviePresenter)
                .environmentObject(tvPresenter)
        }
    }
}
