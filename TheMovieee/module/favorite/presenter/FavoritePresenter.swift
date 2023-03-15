//
//  FavoritePresenter.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import Combine
import SwiftUI

class FavoritePresenter: ObservableObject {

    let favoriteUseCase: FavoriteUseCase
    private let movieRouter = MovieRouter()
    private let tvRouter = TvRouter()

    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }

    private var cancellables: Set<AnyCancellable> = []
    @Published var favoriteMovies: [Movie] = []
    @Published var favoriteTvs: [Tv] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = true

    func getFavoriteMovies() {

        favoriteUseCase.getFavoriteMovies()
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { movies in
                    self.favoriteMovies = movies
                })
                .store(in: &cancellables)
    }

    func getFavoriteTvs() {

        favoriteUseCase.getFavoriteTvs()
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { tvs in
                    self.favoriteTvs = tvs
                })
                .store(in: &cancellables)
    }

    func linkBuilderMovie<Content: View>(
            for movie: Movie,
            @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
                destination: movieRouter.makeDetailView(for: movie)) {
            content()
        }
    }

    func linkBuilderTv<Content: View>(
            for tv: Tv,
            @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
                destination: tvRouter.makeDetailView(for: tv)) {
            content()
        }
    }

}
