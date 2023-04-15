//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import SwiftUI
import Combine

public class GetTvPresenter<TvModel, DetailTvModel, Interactor: TvUseCase>: ObservableObject
where

Interactor.TvModel == TvModel,
Interactor.DetailTvModel == DetailTvModel {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor
    
    public enum State {
        case isLoading
        case failed
        case loaded
        }
    
    @Published public var popularTv: [TvModel] = []
    @Published public var topRatedTv: [TvModel] = []
    @Published public var airingTodayTv: [TvModel] = []
    @Published public var onTheAirTv: [TvModel] = []
    @Published public var popularErrorMessage: String = ""
    @Published public var popularLoadingState: Bool = true
    @Published public var topRatedErrorMessage: String = ""
    @Published public var topRatedLoadingState: Bool = true
    @Published public var airingTodayErrorMessage: String = ""
    @Published public var airingTodayLoadingState: Bool = true
    @Published public var onTheAirErrorMessage: String = ""
    @Published public var onTheAirLoadingState: Bool = true
    
    @Published private(set) var state = State.isLoading
    
    public init(tvUseCase: Interactor) {
        self._useCase = tvUseCase
    }
    
    public func getPopularTv() {
        self.popularLoadingState = true
        
        _useCase.getTvs(type: TvType.POPULAR.rawValue) .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.popularErrorMessage = String(describing: completion)
                    case .finished:
                        self.popularLoadingState = false
                }
            }, receiveValue: { tv in
                self.popularTv = tv
                
            })
            .store(in: &cancellables)
    }
    
    public func getTopRatedTv() {
        self.topRatedLoadingState = true
        
        _useCase.getTvs(type: TvType.TOP_RATED.rawValue) .sink(receiveCompletion: { completion in
            switch completion {
                case .failure:
                    self.topRatedErrorMessage = String(describing: completion)
                case .finished:
                    self.topRatedLoadingState = false
            }
        }, receiveValue: { tv in
            self.topRatedTv = tv
            
        })
        .store(in: &cancellables)
    }
    
    public func getAiringTodayTv() {
        self.airingTodayLoadingState = true
        _useCase.getTvs(type: TvType.AIRING_TODAY.rawValue)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        self.airingTodayErrorMessage = String(describing: completion)
                    case .finished:
                        self.airingTodayLoadingState = false
                }
            }, receiveValue: { tv in
                self.airingTodayTv = tv
                
            })
            .store(in: &cancellables)
    }
    
    public func getOnTheAirTv() {
        self.onTheAirLoadingState = true
        _useCase.getTvs(type: TvType.ON_THE_AIR.rawValue) .sink(receiveCompletion: { completion in
            switch completion {
                case .failure:
                    self.onTheAirErrorMessage = String(describing: completion)
                case .finished:
                    self.onTheAirLoadingState = false
            }
        }, receiveValue: { tv in
            self.onTheAirTv = tv
            
        })
        .store(in: &cancellables)
    }
}
