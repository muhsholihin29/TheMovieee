//
//  File.swift
//  
//
//  Created by Sholi on 12/04/23.
//

import CorePackage
import Combine
import Tv
import Movie

    // 1
public struct GetFavoritesRepository<
    DataSource: LocaleDataSource,
    Transformer: FavoriteMapper
>: FavoriteRepository where
    
DataSource.MovieEntity == FavoriteMovieModuleEntity,
DataSource.TvEntity == FavoriteTvModuleEntity,
Transformer.MovieEntity == FavoriteMovieModuleEntity,
Transformer.MovieDomain == MovieDomainModel,
Transformer.TvEntity == FavoriteTvModuleEntity,
Transformer.TvDomain == TvDomainModel {
    public typealias TvModel = TvDomainModel
    public typealias MovieModel = MovieDomainModel
    
    private let _mapper: Transformer
    private let _localeDataSource: DataSource
    
    public init(
        localeDataSource: DataSource,
        mapper: Transformer) {
            
            _localeDataSource = localeDataSource
            _mapper = mapper
        }
    
    public func getAllFavoriteMovies() -> AnyPublisher<[MovieDomainModel], Error> {
        _localeDataSource.getAllFavoriteMovies()
            .map {
                $0.map { result in
                    _mapper.transformMovieEntityToDomain(entity: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func getFavoriteMovie(id: Int) -> AnyPublisher<[MovieDomainModel], Error> {
        _localeDataSource.getFavoriteMovie(id: id)
            .map {
                $0.map { result in
                    _mapper.transformMovieEntityToDomain(entity: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func addFavoriteMovie(movie: MovieDomainModel) -> AnyPublisher<Bool, Error> {
        _localeDataSource.addFavoriteMovie(entity: _mapper.transformMovieDomainToEntity(domain: movie))
            .eraseToAnyPublisher()
    }
    
    public func deleteFavoriteMovie(movie: MovieDomainModel) -> AnyPublisher<Bool, Error> {
        _localeDataSource.deleteFavoriteMovie(entity: _mapper.transformMovieDomainToEntity(domain: movie))
            .eraseToAnyPublisher()
    }
    
    public func getAllFavoriteTvs() -> AnyPublisher<[TvDomainModel], Error> {
        _localeDataSource.getAllFavoriteTvs()
            .map {
                $0.map { result in
                    _mapper.transformTvEntityToDomain(entity: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func getFavoriteTv(id: Int) -> AnyPublisher<[TvDomainModel], Error> {
        _localeDataSource.getFavoriteTv(id: id)
            .map {
                $0.map { result in
                    _mapper.transformTvEntityToDomain(entity: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    public func addFavoriteTv(tv: TvDomainModel) -> AnyPublisher<Bool, Error> {
        _localeDataSource.addFavoriteTv(entity: _mapper.transformTvDomainToEntity(domain: tv))
            .eraseToAnyPublisher()
    }
    
    public func deleteFavoriteTv(tv: TvDomainModel) -> AnyPublisher<Bool, Error> {
        _localeDataSource.deleteFavoriteTv(entity: _mapper.transformTvDomainToEntity(domain: tv))
            .eraseToAnyPublisher()
    }
}
