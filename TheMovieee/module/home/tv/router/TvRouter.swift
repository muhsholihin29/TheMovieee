//
//  TvRouter.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

class TvRouter {
    func makeDetailView(for tv: Tv) -> some View {
        let detailUseCase = Injection.init().provideTv()
        let presenter = TvDetailPresenter(detailUseCase: detailUseCase)
        return TvDetailView(tv: tv, presenter: presenter)
    }
}
