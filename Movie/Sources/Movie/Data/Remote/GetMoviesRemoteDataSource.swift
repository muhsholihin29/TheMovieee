//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Foundation
import Alamofire
import Core
import Combine

public struct GetMoviesRemoteDataSource : MovieRemoteDataSource {
    public typealias MoviesResponse = [MovieResponse.Result]
    public typealias DetailResponse = DetailMovieResponse
    
    public init() {}
    
    public func getMovies(type: MovieType.RawValue) -> AnyPublisher<[MovieResponse.Result], Error> {
        Future<[MovieResponse.Result], Error> { completion in
            var endpoint = ""
            switch type {
                case MovieType.POPULAR.rawValue:
                    endpoint = Endpoints.Gets.popularMovies.url
                case MovieType.TOP_RATED.rawValue:
                    endpoint = Endpoints.Gets.topRatedMovies.url
                case MovieType.UPCOMING.rawValue:
                    endpoint = Endpoints.Gets.upcomingMovies.url
                default:
                    endpoint = Endpoints.Gets.nowPlayingMovies.url
            }
            
            if let url = URL(string: endpoint) {
                
                AF.request(url).validate().responseDecodable(of: MovieResponse.self) { response in
                    switch response.result {
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    public func getDetailMovie(id: Int) -> AnyPublisher<DetailMovieResponse, Error> {
        Future<DetailMovieResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.detailMovie(id: id).url) {
                
                AF.request(url).validate().responseDecodable(of: DetailMovieResponse.self) { response in
                    switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
