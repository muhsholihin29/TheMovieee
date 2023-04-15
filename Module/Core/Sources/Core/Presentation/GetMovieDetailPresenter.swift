//
//  MovieDetailPresenter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Combine

public class GetMovieDetailPresenter<MovieModel, DetailMovieModel, Interactor: MovieUseCase>: ObservableObject
where

Interactor.MovieModel == MovieModel,
Interactor.DetailMovieModel == DetailMovieModel {
    
    let detailUseCase: Interactor
    
    enum State {
        case isLoading
        case failed
        case loaded
    }
    
    private var cancellables: Set<AnyCancellable> = []
    @Published public var detailMovie: DetailMovieModel?
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = true
    @Published public var isFavorite: Bool = false
    
    @Published private(set) var state = State.isLoading
    
    public init(detailUseCase: Interactor) {
        self.detailUseCase = detailUseCase
    }
    
    public func getDetailMovie(id: Int) {
        loadingState = true
        detailUseCase.getDetailMovie(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                }
            }, receiveValue: { detailMovie in
                    self.detailMovie = detailMovie
                
            })
            .store(in: &cancellables)
    }
    
    public func getFavoriteStatus(id: Int){
        detailUseCase.getFavoriteMovie(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished: break
                }
            }, receiveValue: { favoriteMovie in
                if (!favoriteMovie.isEmpty) {
                    self.isFavorite = true
                } else {
                    self.isFavorite = false
                }
            })
            .store(in: &cancellables)
    }

    public func deleteFavorite(_ movie: MovieModel) {
        detailUseCase.deleteFavoriteMovie(movie: movie)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { favoriteMovie in
                self.isFavorite = false
            })
            .store(in: &cancellables)
    }

    public func addFavorite(_ movie: MovieModel) {
        detailUseCase.addFavoriteMovie(movie: movie)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { favoriteMovie in
                self.isFavorite = true
            })
            .store(in: &cancellables)
    }
}
