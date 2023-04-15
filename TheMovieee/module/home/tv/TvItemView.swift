//
//  TvItemView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI
import Tv

struct TvItemView: View {
    var tv: TvDomainModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\("https://image.tmdb.org/t/p/w200")\(tv.posterPath)")) { phase in
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
            Text(tv.name)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 150, height: 20)
                    .truncationMode(.tail)
        }
    }
}

struct FixedClipped: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content.hidden().layoutPriority(1)
            content.fixedSize(horizontal: true, vertical: false)
        }
                .clipped()
    }
}

//struct TvItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TvItemView()
//    }
//}
