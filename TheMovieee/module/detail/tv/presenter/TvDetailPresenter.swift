//
//  TvDetailPresenter.swift
//  TheMovieee
//
//  Created by Sholi on 14/03/23.
//

import Foundation
import Combine

class TvDetailPresenter: ObservableObject {
    let detailUseCase: TvUseCase
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var detailTv: DetailTv?
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = true
    @Published var isFavorite: Bool = false
    
    init(detailUseCase: TvUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getDetailTv(id: Int) {
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
    
    func getFavoriteStatus(id: Int){
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

    func deleteFavorite(_ tv: Tv) {
        detailUseCase.deleteFavoriteTv(tv: tv)
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

    func addFavorite(_ tv: Tv) {
        detailUseCase.addFavoriteTv(tv: tv)
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
