//
//  FavoritePresenter.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import Combine
import SwiftUI

public class GetFavoritePresenter<MovieModel, TvModel, Interactor: FavoriteUseCase>: ObservableObject where
Interactor.MovieModel == MovieModel,
Interactor.TvModel == TvModel {

    private let favoriteUseCase: Interactor

    public init(favoriteUseCase: Interactor) {
        self.favoriteUseCase = favoriteUseCase
    }

    private var cancellables: Set<AnyCancellable> = []
    @Published public var favoriteMovies: [MovieModel] = []
    @Published public var favoriteTvs: [TvModel] = []
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = true

    public func getFavoriteMovies() {

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

    public func getFavoriteTvs() {

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
}
