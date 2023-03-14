//
//  MovieInteractor.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Combine

protocol MovieUseCase {
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[Movie], Error>
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error>
    func getFavoriteMovie(id: Int) -> AnyPublisher<[Movie], Error>
    func addFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error>
    func deleteFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error>
}

class MovieInteractor: MovieUseCase {
    
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[Movie], Error> {
        repository.getMovies(type: type)
    }
    
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error> {
        repository.getDetailMovie(id: id)
    }
    
    func getFavoriteMovie(id: Int) -> AnyPublisher<[Movie], Error> {
        repository.getFavoriteMovie(id: id)
    }
    
    func addFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error> {
        repository.addFavoriteMovie(movie: movie)
    }
    
    func deleteFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error> {
        repository.deleteFavoriteMovie(movie: movie)
    }
}
