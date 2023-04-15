//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Combine

public protocol LocaleDataSource {
    associatedtype MovieEntity
    associatedtype TvEntity
    
//    func getAllFavorites(request: Request?) -> AnyPublisher<[Response], Error>
//    func getFavorite(id: Int) -> AnyPublisher<Response, Error>
//    func addFavorite(entity: Response) -> AnyPublisher<Bool, Error>
//    func deleteFavorite(entity: Response) -> AnyPublisher<Bool, Error>

    func getAllFavoriteMovies() -> AnyPublisher<[MovieEntity], Error>
    func getAllFavoriteTvs() -> AnyPublisher<[TvEntity], Error>
    func getFavoriteMovie(id: Int) -> AnyPublisher<[MovieEntity], Error>
    func getFavoriteTv(id: Int) -> AnyPublisher<[TvEntity], Error>
    func addFavoriteMovie(entity: MovieEntity) -> AnyPublisher<Bool, Error>
    func addFavoriteTv(entity: TvEntity) -> AnyPublisher<Bool, Error>
    func deleteFavoriteMovie(entity: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteFavoriteTv(entity: TvEntity) -> AnyPublisher<Bool, Error>
}
