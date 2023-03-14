//
//  MovieRouter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

class MovieRouter {
    func makeDetailView(for movie: Movie) -> some View {
        let detailUseCase = Injection.init().provideMovie()
        let presenter = MovieDetailPresenter(detailUseCase: detailUseCase)
        return MovieDetailView(movie: movie, presenter: presenter)
    }
}
