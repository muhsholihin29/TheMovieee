//
//  MovieFavoriteItemView.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import SwiftUI
import Movie

struct MovieFavoriteItemView: View {
    var movie: MovieDomainModel
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: "\("https://image.tmdb.org/t/p/w200")\(movie.posterPath)")) { image in
                    image.resizable()
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 120).cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }

                VStack(alignment: .leading) {

                    Text(movie.title)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .font(Font.system(size: 22))

                    Text("Released: " + (movie.releaseDate))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .font(Font.system(size: 12))
                            .padding(.top, 4)
                    Text("Rating: " + String(movie.voteAverage))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .font(Font.system(size: 12))

                }

            }

        }
    }
}
