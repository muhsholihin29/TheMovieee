//
//  TvItemView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct TvItemView: View {
    var tv: Tv
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\("https://image.tmdb.org/t/p/w500")\(tv.posterPath)")) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .cornerRadius(16)
                    case .failure:
                        Image(systemName: "xmark.octagon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .cornerRadius(16)
                    @unknown default:
                        fatalError("Unhandled phase")
                }
            }
            .frame(width: 150, height: 200)
            .padding(2)
        }
    }
}

//struct TvItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TvItemView()
//    }
//}
