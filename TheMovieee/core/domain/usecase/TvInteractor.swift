//
//  TvInteractor.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import Combine

protocol TvUseCase {
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[Tv], Error>
    func getDetailTv(id: Int) -> AnyPublisher<DetailTv, Error>
    func getFavoriteTv(id: Int) -> AnyPublisher<[Tv], Error>
    func addFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>
    func deleteFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error>
}

class TvInteractor: TvUseCase {
    
    private let repository: TvRepositoryProtocol
    
    required init(repository: TvRepositoryProtocol) {
        self.repository = repository
    }
    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[Tv], Error> {
        repository.getTvs(type: type)
    }
    
    func getDetailTv(id: Int) -> AnyPublisher<DetailTv, Error> {
        repository.getDetailTv(id: id)
    }
    
    func getFavoriteTv(id: Int) -> AnyPublisher<[Tv], Error> {
        repository.getFavoriteTv(id: id)
    }
    
    func addFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error> {
        repository.addFavoriteTv(tv: tv)
    }
    
    func deleteFavoriteTv(tv: Tv) -> AnyPublisher<Bool, Error> {
        repository.deleteFavoriteTv(tv: tv)
    }
}
