//
//  File.swift
//  
//
//  Created by Sholi on 11/04/23.
//

import Foundation
import Combine

public protocol TvUseCase {
    associatedtype TvModel
    associatedtype DetailTvModel
    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvModel], Error>
    func getDetailTv(id: Int) -> AnyPublisher<DetailTvModel, Error>
    func getFavoriteTv(id: Int) -> AnyPublisher<[TvModel], Error>
    func addFavoriteTv(Tv: TvModel) -> AnyPublisher<Bool, Error>
    func deleteFavoriteTv(Tv: TvModel) -> AnyPublisher<Bool, Error>
}

public struct TvInteractor<TvModel, DetailTvModel, MR: TvRepository, FR: FavoriteRepository>: TvUseCase
where
MR.TvsResponse == TvModel,
MR.DetailResponse == DetailTvModel,
FR.TvModel == TvModel {
    
    private let _TvRepository: MR
    private let _favoriteRepository: FR
    
    public init(tvRepository: MR, favoriteRepository: FR) {
        _TvRepository = tvRepository
        _favoriteRepository = favoriteRepository
    }
    
    public func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvModel], Error> {
        _TvRepository.getTvs(type: type)
    }
    
    public func getDetailTv(id: Int) -> AnyPublisher<DetailTvModel, Error> {
        _TvRepository.getDetailTv(id: id)
    }
    
    public func getFavoriteTv(id: Int) -> AnyPublisher<[TvModel], Error> {
        _favoriteRepository.getFavoriteTv(id: id)
    }
    
    public func addFavoriteTv(Tv: TvModel) -> AnyPublisher<Bool, Error> {
        _favoriteRepository.addFavoriteTv(tv: Tv)
    }
    
    public func deleteFavoriteTv(Tv: TvModel) -> AnyPublisher<Bool, Error> {
        _favoriteRepository.deleteFavoriteTv(tv: Tv)
    }
}

