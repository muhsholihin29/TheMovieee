//
//  TvFavoriteItemView.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import SwiftUI
import Tv

struct TvFavoriteItemView: View {
    var tv: TvDomainModel
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: "\("https://image.tmdb.org/t/p/w200")\(tv.posterPath)")) { image in
                    image.resizable()
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 120).cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }

                VStack(alignment: .leading) {

                    Text(tv.name)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .font(Font.system(size: 22))

                    Text("Released: " + (tv.firstAirDate))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .font(Font.system(size: 12))
                            .padding(.top, 4)
                    Text("Rating: " + String(tv.voteAverage))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .font(Font.system(size: 12))

                }

            }

        }
    }
}
