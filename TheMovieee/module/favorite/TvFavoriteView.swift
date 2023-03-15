//
//  TvFavoriteView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct TvFavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter

    var body: some View {
        VStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ActivityIndicator()
                }
            } else {
                List(presenter.favoriteTvs, id: \.id) { tv in
                    VStack {

                        self.presenter.linkBuilderTv(for: tv) {
                                    TvFavoriteItemView(tv: tv)
                                }
                                .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}
