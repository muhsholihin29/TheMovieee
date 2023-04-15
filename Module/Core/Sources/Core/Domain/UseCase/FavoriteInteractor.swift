//
//  File.swift
//  
//
//  Created by Sholi on 11/04/23.
//

import Combine

public protocol FavoriteUseCase {
    associatedtype MovieModel
    associatedtype TvModel
    
    func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
    func getFavoriteTvs() -> AnyPublisher<[TvModel], Error>
}

public struct FavoriteInteractor<MovieModel, TvModel, R: FavoriteRepository>: FavoriteUseCase
where R.MovieModel == MovieModel, R.TvModel == TvModel {
    
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
    
    public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
        repository.getAllFavoriteMovies()
    }
    
    public func getFavoriteTvs() -> AnyPublisher<[TvModel], Error> {
        repository.getAllFavoriteTvs()
    }
}
