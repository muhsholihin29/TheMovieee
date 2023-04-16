//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import CorePackage
import Combine

public struct GetTvsRepository<
    RemoteDataSource: TvRemoteDataSource,
    Transformer: TvMapper
>: TvRepository where

RemoteDataSource.TvsResponse == [TvResponse.Result],
RemoteDataSource.DetailResponse == DetailTvResponse,
Transformer.Response == [TvResponse.Result],
Transformer.TvDomain == [TvDomainModel],
Transformer.DetailResponse == DetailTvResponse,
Transformer.DetailDomain == DetailTvDomainModel
{
    
    public typealias TvsResponse = TvDomainModel
    public typealias DetailResponse = DetailTvDomainModel
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
            
            _remoteDataSource = remoteDataSource
            _mapper = mapper
        }
    
    public func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvDomainModel], Error> {
        _remoteDataSource.getTvs(type: type)
            .map {
                _mapper.transformTvResponseToDomain(response: $0)
            }
            .eraseToAnyPublisher()
    }
    
    public func getDetailTv(id: Int) -> AnyPublisher<DetailTvDomainModel, Error> {
        _remoteDataSource.getDetailTv(id: id)
            .map {
                _mapper.transformDetailTvResponseToDomain(response: $0)
            }
            .eraseToAnyPublisher()
        
    }
}
