//
//  TvListView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import CorePackage
import Tv
import Favorite

struct TvListView: View {
    @ObservedObject var presenter: GetTvPresenter<TvDomainModel, DetailTvDomainModel, TvInteractor<TvDomainModel, DetailTvDomainModel, GetTvsRepository<GetTvsRemoteDataSource, TvTransformer>, GetFavoritesRepository<GetFavoriteLocaleDataSource, FavoriteTransformer>>>
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    Text("Popular Tv")
                    if presenter.popularLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.presenter.popularTv, id: \.id) { tv in
                                    
                                    ZStack {
                                        linkBuilder(for: tv) {
                                            TvItemView(tv: tv)
                                        }.buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.popularTv.count == 0 {
                        self.presenter.getPopularTv()
                    }
                }
                VStack {
                    Text("Top Rated Tv")
                    if presenter.topRatedLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.presenter.topRatedTv, id: \.id) { tv in
                                
                                ZStack {
                                    linkBuilder(for: tv) {
                                        TvItemView(tv: tv)
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.topRatedTv.count == 0 {
                        self.presenter.getTopRatedTv()
                    }
                }
                
                VStack {
                    Text("On The Air Tv Shows")
                    if presenter.onTheAirLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.presenter.onTheAirTv, id: \.id) { tv in
                                    
                                    ZStack {
                                        linkBuilder(for: tv) {
                                            TvItemView(tv: tv)
                                        }.buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.onTheAirTv.count == 0 {
                        self.presenter.getOnTheAirTv()
                    }
                }
                
                VStack {
                    Text("Airing Today Tv")
                    if presenter.airingTodayLoadingState {
                        VStack {
                            Text("Loading...")
                            ActivityIndicator()
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.presenter.airingTodayTv, id: \.id) { tv in
                                    
                                    ZStack {
                                        linkBuilder(for: tv) {
                                            TvItemView(tv: tv)
                                        }.buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }.onAppear {
                    if self.presenter.airingTodayTv.count == 0 {
                        self.presenter.getAiringTodayTv()
                    }
                }
            }
        }.navigationBarTitle(
                        Text("TheMovieee"),
                        displayMode: .automatic
                )
    }
    
    func item(tv: TvDomainModel) -> some View {
        ZStack {
            linkBuilder(for: tv) {
                TvItemView(tv: tv)
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    func linkBuilder<Content: View>(
        for tv: TvDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: TvRouter().makeDetailView(for: tv)) { content() }
    }
}
