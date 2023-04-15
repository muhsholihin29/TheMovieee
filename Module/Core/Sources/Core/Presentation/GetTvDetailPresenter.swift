//
//  TvDetailPresenter.swift
//  TheMovieee
//
//  Created by Sholi on 14/03/23.
//

import Foundation
import Combine

public class GetTvDetailPresenter<TvModel, DetailTvModel, Interactor: TvUseCase>: ObservableObject
where

Interactor.TvModel == TvModel,
Interactor.DetailTvModel == DetailTvModel {
    let detailUseCase: Interactor
    
    private var cancellables: Set<AnyCancellable> = []
    @Published public var detailTv: DetailTvModel?
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = true
    @Published public var isFavorite: Bool = false
    
    public init(detailUseCase: Interactor) {
        self.detailUseCase = detailUseCase
    }
    
    public func getDetailTv(id: Int) {
        self.loadingState = true
        
        detailUseCase.getDetailTv(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                }
            }, receiveValue: { detailTv in
                
                    self.detailTv = detailTv
                
            })
            .store(in: &cancellables)
    }
    
    public func getFavoriteStatus(id: Int){
        detailUseCase.getFavoriteTv(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                case .finished: break
                }
            }, receiveValue: { favoriteTv in
                if (!favoriteTv.isEmpty){
                    self.isFavorite = true
                } else {
                    self.isFavorite = false
                }
            })
            .store(in: &cancellables)
    }

    public func deleteFavorite(_ tv: TvModel) {
        detailUseCase.deleteFavoriteTv(Tv: tv)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { favoriteTv in
                self.isFavorite = false
            })
            .store(in: &cancellables)
    }

    public func addFavorite(_ tv: TvModel) {
        detailUseCase.addFavoriteTv(Tv: tv)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.errorMessage = String(describing: completion)
                    case .finished:
                        self.loadingState = false
                    }
                }, receiveValue: { favoriteTv in
                self.isFavorite = true
            })
            .store(in: &cancellables)
    }
}
