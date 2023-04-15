//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import Combine

public protocol FavoriteRepository {
    associatedtype TvModel
    associatedtype MovieModel

    func getAllFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
    func getFavoriteMovie(id: Int) -> AnyPublisher<[MovieModel], Error>
    func addFavoriteMovie(movie: MovieModel) -> AnyPublisher<Bool, Error>
    func deleteFavoriteMovie(movie: MovieModel) -> AnyPublisher<Bool, Error>

    func getAllFavoriteTvs() -> AnyPublisher<[TvModel], Error>
    func getFavoriteTv(id: Int) -> AnyPublisher<[TvModel], Error>
    func addFavoriteTv(tv: TvModel) -> AnyPublisher<Bool, Error>
    func deleteFavoriteTv(tv: TvModel) -> AnyPublisher<Bool, Error>
}
