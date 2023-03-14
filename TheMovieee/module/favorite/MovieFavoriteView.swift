//
//  MovieFavoriteView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct MovieFavoriteView: View {

    var body: some View {
        VStack {
//            List(listData, id: \.id) { game in
//                VStack {
//                    GameItemView(game:
//                                    Game(id: Int(game.id!), slug: nil, name: game.name, released: game.released, tba: nil,
//                                         backgroundImage: game.backgroundImage, rating: game.rating ?? 0.0, ratingTop: nil, ratingsCount: nil, reviewsTextCount: nil, added: nil, metacritic: nil, playtime: nil, suggestionsCount: nil, updated: nil, platforms: nil)
//                    )
//                    NavigationLink(destination: DetailView(game: Game(id: Int(game.id!), slug: nil, name: game.name, released: game.released, tba: nil, backgroundImage: game.backgroundImage, rating: game.rating ?? 0.0, ratingTop: nil, ratingsCount: nil, reviewsTextCount: nil, added: nil, metacritic: nil, playtime: nil, suggestionsCount: nil, updated: nil, platforms: nil))) {
//                        EmptyView()
//                    }
//                }
//            }
//            .task {
//                isHideLoader = false
//                gameProvider.getAllFavorite { games in
//                    isHideLoader = true
//                    listData = games
//                }
//            }
//            .alert(isPresented: self.$showErrorAlert) {
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .cancel())
//            }
        }
    }
}

struct MovieFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MovieFavoriteView()
    }
}
