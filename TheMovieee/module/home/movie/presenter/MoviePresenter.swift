//
//  MoviePresenter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Combine

class MoviePresenter: ObservableObject {
    
    private let router = MovieRouter()
    let movieUseCase: MovieUseCase
    
    enum State {
        case isLoading
        case failed
        case loaded
    }
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    
    @Published var popularErrorMessage: String = ""
    @Published var popularLoadingState: Bool = true
    @Published var topRatedErrorMessage: String = ""
    @Published var topRatedLoadingState: Bool = true
    @Published var nowPlayingErrorMessage: String = ""
    @Published var nowPlayingLoadingState: Bool = true
    @Published var upcomingErrorMessage: String = ""
    @Published var upcomingLoadingState: Bool = true
    
    @Published private(set) var state = State.isLoading
    
    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }
    
    func getPopularMovies() {
        popularLoadingState = true
        
        movieUseCase.getMovies(type: MovieType.POPULAR.rawValue)
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
    
    func getTopRatedMovies() {
        topRatedLoadingState = true
        movieUseCase.getMovies(type: MovieType.TOP_RATED.rawValue)
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
    
    func getNowPlayingMovies() {
        nowPlayingLoadingState = true
        movieUseCase.getMovies(type: MovieType.NOW_PLAYING.rawValue) .receive(on: RunLoop.main)
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
    
    func getUpcomingMovies() {
        upcomingLoadingState = true
        movieUseCase.getMovies(type: MovieType.UPCOMING.rawValue) .receive(on: RunLoop.main)
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
    
    func linkBuilder<Content: View>(
            for movie: Movie,
            @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
                destination: router.makeDetailView(for: movie)) {
            content()
        }
    }
}
