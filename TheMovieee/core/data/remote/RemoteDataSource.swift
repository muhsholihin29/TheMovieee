//
//  RemoteDataSource.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: AnyObject {
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[MovieResponse.Result], Error>
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovieResponse, Error>
    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvResponse.Result], Error>
    func getDetailTv(id: Int) -> AnyPublisher<DetailTvResponse, Error>
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[MovieResponse.Result], Error> {
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
    
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovieResponse, Error> {
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
    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvResponse.Result], Error> {
        return Future<[TvResponse.Result], Error> { completion in
            var endpoint = ""
            switch type {
                case TvType.POPULAR.rawValue:
                    endpoint = Endpoints.Gets.popularTv.url
                case TvType.TOP_RATED.rawValue:
                    endpoint = Endpoints.Gets.topRatedTv.url
                case TvType.ON_THE_AIR.rawValue:
                    endpoint = Endpoints.Gets.onTheAirTv.url
                default:
                    endpoint = Endpoints.Gets.airingTodayTv.url
            }
            
            if let url = URL(string: endpoint) {
                
                AF.request(url).validate().responseDecodable(of: TvResponse.self) { response in
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
    
    
    func getDetailTv(id: Int) -> AnyPublisher<DetailTvResponse, Error> {
        Future<DetailTvResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.detailTv(id: id).url) {

                AF.request(url).validate().responseDecodable(of: DetailTvResponse.self) { response in
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
