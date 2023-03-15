//
//  LocalDataSource.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift
import Combine

protocol LocalDataSourceProtocol: AnyObject {
    
    func getAllFavoriteMovies() -> AnyPublisher<[FavoriteMovieEntity], Error>
    func getAllFavoriteTvs() -> AnyPublisher<[FavoriteTvEntity], Error>
    func getFavoriteMovie(id: Int) -> AnyPublisher<[FavoriteMovieEntity], Error>
    func getFavoriteTv(id: Int) -> AnyPublisher<[FavoriteTvEntity], Error>
    func addFavoriteMovie(entity: FavoriteMovieEntity) -> AnyPublisher<Bool, Error>
    func addFavoriteTv(entity: FavoriteTvEntity) -> AnyPublisher<Bool, Error>
    func deleteFavoriteMovie(entity: FavoriteMovieEntity) -> AnyPublisher<Bool, Error>
    func deleteFavoriteTv(entity: FavoriteTvEntity) -> AnyPublisher<Bool, Error>
}

final class LocalDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> LocalDataSource = {
        realmDatabase in return LocalDataSource(realm: realmDatabase)
    }
    
}

extension LocalDataSource: LocalDataSourceProtocol {
    
    func addFavoriteMovie(entity: FavoriteMovieEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(entity, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addFavoriteTv(entity: FavoriteTvEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(entity, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteMovie(id: Int) -> AnyPublisher<[FavoriteMovieEntity], Error> {
        return Future<[FavoriteMovieEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<FavoriteMovieEntity> = {
                    realm.objects(FavoriteMovieEntity.self)
                        .filter("movieId = \(id)")
                }()
                completion(.success(categories.toArray(ofType: FavoriteMovieEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteTv(id: Int) -> AnyPublisher<[FavoriteTvEntity], Error> {
        return Future<[FavoriteTvEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<FavoriteTvEntity> = {
                    realm.objects(FavoriteTvEntity.self)
                        .filter("tvId = \(id)")
                }()
                completion(.success(categories.toArray(ofType: FavoriteTvEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getAllFavoriteMovies() -> AnyPublisher<[FavoriteMovieEntity], Error> {
        return Future<[FavoriteMovieEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<FavoriteMovieEntity> = {
                    realm.objects(FavoriteMovieEntity.self)
                            .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: FavoriteMovieEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getAllFavoriteTvs() -> AnyPublisher<[FavoriteTvEntity], Error> {
        return Future<[FavoriteTvEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<FavoriteTvEntity> = {
                    realm.objects(FavoriteTvEntity.self)
                            .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: FavoriteTvEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func deleteFavoriteMovie(entity: FavoriteMovieEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let movies: Results<FavoriteMovieEntity> = {
                        realm.objects(FavoriteMovieEntity.self)
                    }()
                    let movie = movies.filter("movieId == \(entity.movieId)")
                    try realm.write {
                        realm.delete(movie)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func deleteFavoriteTv(entity: FavoriteTvEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let tvs: Results<FavoriteTvEntity> = {
                        realm.objects(FavoriteTvEntity.self)
                    }()
                    let tv = tvs.filter("tvId == \(entity.tvId)")
                    try realm.write {
                        realm.delete(tv)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
