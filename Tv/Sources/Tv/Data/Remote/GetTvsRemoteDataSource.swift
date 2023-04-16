//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Foundation
import Alamofire
import CorePackage
import Combine

public struct GetTvsRemoteDataSource : TvRemoteDataSource {
    
    public typealias TvsRequest = Any
    public typealias TvsResponse = [TvResponse.Result]
    public typealias DetailResponse = DetailTvResponse

    public init() {}
    
    public func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvResponse.Result], Error> {
        Future<[TvResponse.Result], Error> { completion in
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
    
    public func getDetailTv(id: Int) -> AnyPublisher<DetailTvResponse, Error> {
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
