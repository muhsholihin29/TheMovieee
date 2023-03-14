//
//  MovieDetailPresenter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Combine

class MovieDetailPresenter: ObservableObject {
    let detailUseCase: MovieUseCase
    
    enum State {
        case isLoading
        case failed
        case loaded
    }
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var detailMovie: DetailMovie?
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = true
    @Published var isFavorite: Bool = false
    
    @Published private(set) var state = State.isLoading
    
    init(detailUseCase: MovieUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getDetailMovie(id: Int) {
        self.loadingState = true
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
                print(detailMovie.backdropPath)
                    self.detailMovie = detailMovie
                
            })
            .store(in: &cancellables)
    }
    
    func getFavoriteStatus(id: Int){
        detailUseCase.getFavoriteMovie(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                }
            }, receiveValue: { favoriteTv in
                if (!favoriteTv.isEmpty){
                    self.isFavorite = true
                } else {
                    self.isFavorite = false
                }
            })
            .store(in: &cancellables)
    }
    
    func updateFavorite(movie: Movie){
        detailUseCase.getFavoriteMovie(id: movie.id ?? 0)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                }
            }, receiveValue: { favoriteMovie in
                if (!favoriteMovie.isEmpty){
                    self.deleteFavorite(movie)
                } else {
                    self.addFavorite(movie)
                }
            })
            .store(in: &cancellables)
    }
    
    private func deleteFavorite(_ movie: Movie){
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
    
    private func addFavorite(_ movie: Movie){
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
