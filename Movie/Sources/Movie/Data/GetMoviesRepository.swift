//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Core
import Combine

    // 1
public struct GetMoviesRepository<
    RemoteDataSource: MovieRemoteDataSource,
    Transformer: MovieMapper
>: MovieRepository where

RemoteDataSource.MoviesResponse == [MovieResponse.Result],
RemoteDataSource.DetailResponse == DetailMovieResponse,
Transformer.Response == [MovieResponse.Result],
Transformer.MovieDomain == [MovieDomainModel],
Transformer.DetailResponse == DetailMovieResponse,
Transformer.DetailDomain == DetailMovieDomainModel
{
    
    public typealias MoviesResponse = MovieDomainModel
    public typealias DetailResponse = DetailMovieDomainModel
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
            _remoteDataSource = remoteDataSource
            _mapper = mapper
        }
    
    public func getMovies(type: MovieType.RawValue) -> AnyPublisher<[MovieDomainModel], Error> {
        _remoteDataSource.getMovies(type: type)
            .map {
                _mapper.transformMovieResponseToDomain(response: $0)
            }
            .eraseToAnyPublisher()
    }
    
    public func getDetailMovie(id: Int) -> AnyPublisher<DetailMovieDomainModel, Error> {
        _remoteDataSource.getDetailMovie(id: id)
            .map {
                _mapper.transformDetailMovieResponseToDomain(response: $0)
            }
            .eraseToAnyPublisher()
        
    }
}
