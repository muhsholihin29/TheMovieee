//
//  TvRouter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Tv
import Core
import Favorite

class TvRouter {
    func makeDetailView(for tv: TvDomainModel) -> some View {
        let detailUseCase: TvInteractor<
            TvDomainModel,
            DetailTvDomainModel,
            GetTvsRepository<
                GetTvsRemoteDataSource,
                TvTransformer>,
            GetFavoritesRepository<
                GetFavoriteLocaleDataSource,
                FavoriteTransformer>
        > = Injection.init().provideTv()
        let presenter = GetTvDetailPresenter(detailUseCase: detailUseCase)
        return TvDetailView(tv: tv, presenter: presenter)
    }
}
