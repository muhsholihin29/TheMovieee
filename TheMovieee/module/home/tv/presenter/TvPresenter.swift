//
//  TvPresenter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Combine

class TvPresenter: ObservableObject {
    
    private let router = TvRouter()
    let tvUseCase: TvUseCase
    
    enum State {
        case isLoading
        case failed
        case loaded
    }
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var popularTv: [Tv] = []
    @Published var topRatedTv: [Tv] = []
    @Published var airingTodayTv: [Tv] = []
    @Published var onTheAirTv: [Tv] = []
    @Published var popularErrorMessage: String = ""
    @Published var popularLoadingState: Bool = true
    @Published var topRatedErrorMessage: String = ""
    @Published var topRatedLoadingState: Bool = true
    @Published var airingTodayErrorMessage: String = ""
    @Published var airingTodayLoadingState: Bool = true
    @Published var onTheAirErrorMessage: String = ""
    @Published var onTheAirLoadingState: Bool = true
    
    @Published private(set) var state = State.isLoading
    
    init(tvUseCase: TvUseCase) {
        self.tvUseCase = tvUseCase
    }
    
    func getPopularTv() {
        self.popularLoadingState = true
        
        tvUseCase.getTvs(type: TvType.POPULAR.rawValue) .receive(on: RunLoop.main)
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
    
    func getTopRatedTv() {
        self.topRatedLoadingState = true
        
        tvUseCase.getTvs(type: TvType.TOP_RATED.rawValue) .sink(receiveCompletion: { completion in
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
    
    func getAiringTodayTv() {
        self.airingTodayLoadingState = true
        tvUseCase.getTvs(type: TvType.AIRING_TODAY.rawValue)
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
    
    func getOnTheAirTv() {
        self.onTheAirLoadingState = true
        tvUseCase.getTvs(type: TvType.ON_THE_AIR.rawValue) .sink(receiveCompletion: { completion in
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
    
    func linkBuilder<Content: View>(
        for tv: Tv,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: tv)) { content() }
    }
}
 
