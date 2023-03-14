//
//  MovieRepository.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//


import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[Movie], Error>
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error>
    
    func getAllFavoriteMovies() -> AnyPublisher<[Movie], Error>
    func getFavoriteMovie(id: Int) -> AnyPublisher<[Movie], Error>
    func addFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error>
    func deleteFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error>
}

final class MovieRepository: NSObject {
    typealias MovieInstance = (LocalDataSource, RemoteDataSource) -> MovieRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(local: LocalDataSource, remote: RemoteDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: MovieInstance = { localRepo, remoteRepo in
        return MovieRepository(local: localRepo, remote: remoteRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[Movie], Error> {
                    return self.remote.getMovies(type: type)
                        .map { DataMapper.mapMovieResponseToDomain(input: $0) }
                        .eraseToAnyPublisher()
    }
    
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error> {
                    return self.remote.getDetailMovie(id: id)
                        .map { DataMapper.mapDetailMovieResponseToDomain(input: $0) }
                        .eraseToAnyPublisher()
                
    }
    
    func getAllFavoriteMovies() -> AnyPublisher<[Movie], Error> {
        return self.local.getAllFavoriteMovies()
            .map {
                $0.map { result in
                    DataMapper.mapFavoriteMovieEntityToDomain(input: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getAllFavoriteTvs() -> AnyPublisher<[Tv], Error> {
        return self.local.getAllFavoriteTvs()
            .map {
                $0.map { result in
                    DataMapper.mapFavoriteTvEntityToDomain(input: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getFavoriteMovie(id: Int) -> AnyPublisher<[Movie], Error> {
        return self.local.getFavoriteMovie(id: id)
            .map {
                $0.map { result in
                    DataMapper.mapFavoriteMovieEntityToDomain(input: result)
                }
            }
            .eraseToAnyPublisher()
    }
    func getFavoriteTv(id: Int) -> AnyPublisher<[Tv], Error> {
        return self.local.getAllFavoriteTvs()
            .map {
                $0.map { result in
                    DataMapper.mapFavoriteTvEntityToDomain(input: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func addFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error> {
        return self.local.addFavoriteMovie(entity: DataMapper.mapMovieToFavoriteEntity(input: movie))
            .eraseToAnyPublisher()
    }
    
    func addFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>{
        return self.local.addFavoriteTv(entity: DataMapper.mapTvToFavoriteEntity(input: tv))
            .eraseToAnyPublisher()
    }
    
    func deleteFavoriteMovie(movie: Movie) -> AnyPublisher<Bool, Error> {
        return self.local.deleteFavoriteMovie(entity: DataMapper.mapMovieToFavoriteEntity(input: movie))
            .eraseToAnyPublisher()
    }
    
    func deleteFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error> {
        return self.local.deleteFavoriteTv(entity: DataMapper.mapTvToFavoriteEntity(input: tv))
            .eraseToAnyPublisher()
    }
}
