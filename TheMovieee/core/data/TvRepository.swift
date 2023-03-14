//
//  TvRepository.swift
//  Theee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Combine

protocol TvRepositoryProtocol {

    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[Tv], Error>
    func getDetailTv(id: Int) -> AnyPublisher<DetailTv, Error>

    func getAllFavoriteTvs() -> AnyPublisher<[Tv], Error>

    func getFavoriteTv(id: Int) -> AnyPublisher<[Tv], Error>

    func addFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>

    func deleteFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>
}

final class TvRepository: NSObject {
    typealias TvInstance = (LocalDataSource, RemoteDataSource) -> TvRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(local: LocalDataSource, remote: RemoteDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: TvInstance = { localRepo, remoteRepo in
        return TvRepository(local: localRepo, remote: remoteRepo)
    }
}

extension TvRepository: TvRepositoryProtocol {

    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[Tv], Error> {
                    return self.remote.getTvs(type: type)
                        .map { DataMapper.mapTvResponseToDomain(input: $0) }
                        .eraseToAnyPublisher()
    }
    
    func getDetailTv(id: Int) -> AnyPublisher<DetailTv, Error> {
                    return self.remote.getDetailTv(id: id)
                        .map { DataMapper.mapDetailTvResponseToDomain(input: $0) }
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
    
    func getFavoriteTv(id: Int) -> AnyPublisher<[Tv], Error> {
        return self.local.getAllFavoriteTvs()
            .map {
                $0.map { result in
                    DataMapper.mapFavoriteTvEntityToDomain(input: result)
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    func addFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>{
        return self.local.addFavoriteTv(entity: DataMapper.mapTvToFavoriteEntity(input: tv))
            .eraseToAnyPublisher()
    }
    
    func deleteFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error> {
        return self.local.deleteFavoriteTv(entity: DataMapper.mapTvToFavoriteEntity(input: tv))
            .eraseToAnyPublisher()
    }
}
