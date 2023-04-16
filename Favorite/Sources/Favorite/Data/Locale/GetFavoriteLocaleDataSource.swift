
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import CorePackage
import Combine
import RealmSwift
import Foundation

public struct GetFavoriteLocaleDataSource: LocaleDataSource {
    public typealias MovieEntity = FavoriteMovieModuleEntity
    public typealias TvEntity = FavoriteTvModuleEntity
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func addFavoriteMovie(entity: FavoriteMovieModuleEntity) -> AnyPublisher<Bool, Error> {
        Future<Bool, Error> { completion in

                do {
                    try realm.write {
                        realm.add(entity, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            
        }.eraseToAnyPublisher()
    }
    
    public func addFavoriteTv(entity: FavoriteTvModuleEntity) -> AnyPublisher<Bool, Error> {
        Future<Bool, Error> { completion in
            
                do {
                    try realm.write {
                        realm.add(entity, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            
        }.eraseToAnyPublisher()
    }
    
    public func getFavoriteMovie(id: Int) -> AnyPublisher<[FavoriteMovieModuleEntity], Error> {
        Future<[FavoriteMovieModuleEntity], Error> { completion in
            
                let categories: Results<FavoriteMovieModuleEntity> = realm.objects(FavoriteMovieModuleEntity.self)
                    .filter("movieId = \(id)")
                completion(.success(categories.toArray(ofType: FavoriteMovieModuleEntity.self)))
            
        }.eraseToAnyPublisher()
    }
    
    public func getFavoriteTv(id: Int) -> AnyPublisher<[FavoriteTvModuleEntity], Error> {
        Future<[FavoriteTvModuleEntity], Error> { completion in
            
                let categories: Results<FavoriteTvModuleEntity> = realm.objects(FavoriteTvModuleEntity.self)
                    .filter("tvId = \(id)")
                completion(.success(categories.toArray(ofType: FavoriteTvModuleEntity.self)))
            
        }
        .eraseToAnyPublisher()
    }
    
    public func getAllFavoriteMovies() -> AnyPublisher<[FavoriteMovieModuleEntity], Error> {
        Future<[FavoriteMovieModuleEntity], Error> { completion in
            
                let categories: Results<FavoriteMovieModuleEntity> = realm.objects(FavoriteMovieModuleEntity.self)
                    .sorted(byKeyPath: "title", ascending: true)
                completion(.success(categories.toArray(ofType: FavoriteMovieModuleEntity.self)))
            
        }
        .eraseToAnyPublisher()
    }
    
    public func getAllFavoriteTvs() -> AnyPublisher<[FavoriteTvModuleEntity], Error> {
        Future<[FavoriteTvModuleEntity], Error> { completion in
            
                let categories: Results<FavoriteTvModuleEntity> = realm.objects(FavoriteTvModuleEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
                completion(.success(categories.toArray(ofType: FavoriteTvModuleEntity.self)))
            
        }
        .eraseToAnyPublisher()
    }
    
    public func deleteFavoriteMovie(entity: FavoriteMovieModuleEntity) -> AnyPublisher<Bool, Error> {
        Future<Bool, Error> { completion in
                do {
                    let movies: Results<FavoriteMovieModuleEntity> = realm.objects(FavoriteMovieModuleEntity.self)
                    let movie = movies.filter("movieId == \(entity.movieId)")
                    try realm.write {
                        realm.delete(movie)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
        }
        .eraseToAnyPublisher()
    }
    
    public func deleteFavoriteTv(entity: FavoriteTvModuleEntity) -> AnyPublisher<Bool, Error> {
        Future<Bool, Error> { completion in
            
                do {
                    let tvs: Results<FavoriteTvModuleEntity> = realm.objects(FavoriteTvModuleEntity.self)
                    let tv = tvs.filter("tvId == \(entity.tvId)")
                    try realm.write {
                        realm.delete(tv)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
        }.eraseToAnyPublisher()
    }
}
