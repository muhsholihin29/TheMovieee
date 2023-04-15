//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import SwiftUI
import Combine

public class GetMoviePresenter<MovieModel, DetailMovieModel, Interactor: MovieUseCase>: ObservableObject
where
 
Interactor.MovieModel == MovieModel,
Interactor.DetailMovieModel == DetailMovieModel {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor

    enum State {
        case isLoading
        case failed
        case loaded
    }
    
    @Published public var popularMovies: [MovieModel] = []
    @Published public var topRatedMovies: [MovieModel] = []
    @Published public var nowPlayingMovies: [MovieModel] = []
    @Published public var upcomingMovies: [MovieModel] = []
    
    @Published public var popularErrorMessage: String = ""
    @Published public var popularLoadingState: Bool = true
    @Published public var topRatedErrorMessage: String = ""
    @Published public var topRatedLoadingState: Bool = true
    @Published public var nowPlayingErrorMessage: String = ""
    @Published public var nowPlayingLoadingState: Bool = true
    @Published public var upcomingErrorMessage: String = ""
    @Published public var upcomingLoadingState: Bool = true
    
    @Published private(set) var state = State.isLoading
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getPopularMovies() {
        popularLoadingState = true
        
        _useCase.getMovies(type: MovieType.POPULAR.rawValue)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.popularErrorMessage = String(describing: completion)
                    case .finished:
                        self.popularLoadingState = false
                }
            }, receiveValue: { movies in
                self.popularMovies = movies
                
            })
            .store(in: &cancellables)
    }
    
    public func getTopRatedMovies() {
        topRatedLoadingState = true
        _useCase.getMovies(type: MovieType.TOP_RATED.rawValue)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.topRatedErrorMessage = String(describing: completion)
                    case .finished:
                        self.topRatedLoadingState = false
                }
            }, receiveValue: { movies in
                self.topRatedMovies = movies
                
            })
            .store(in: &cancellables)
    }
    
    public func getNowPlayingMovies() {
        nowPlayingLoadingState = true
        _useCase.getMovies(type: MovieType.NOW_PLAYING.rawValue) .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.nowPlayingErrorMessage = String(describing: completion)
                    case .finished:
                        self.nowPlayingLoadingState = false
                }
            }, receiveValue: { movies in
                self.nowPlayingMovies = movies
                
            })
            .store(in: &cancellables)
    }
    
    public func getUpcomingMovies() {
        upcomingLoadingState = true
        _useCase.getMovies(type: MovieType.UPCOMING.rawValue) .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.upcomingErrorMessage = String(describing: completion)
                    case .finished:
                        self.upcomingLoadingState = false
                }
            }, receiveValue: { movies in
                self.upcomingMovies = movies
                
            })
            .store(in: &cancellables)
    }
}
