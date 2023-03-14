//
//  MovieDetailView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    @ObservedObject var presenter: MovieDetailPresenter
    
    var body: some View {
        VStack(alignment: .center) {
            if presenter.loadingState {
                ProgressView()
                Text("Sedang memuat data...")
                    .padding()
            } else {
                ScrollView {
                    
                    VStack(alignment: .leading) {
                        
                        AsyncImage(url: URL(string: "\("https://image.tmdb.org/t/p/w500")\(presenter.detailMovie!.backdropPath)")) { phase in
                            switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(height: 200)
                                        .cornerRadius(20)
                                        .shadow(color: .white, radius: 4)
                                        .padding(.top, 20)
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
                        
                        Text(presenter.detailMovie?.title ?? "")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.vertical, 8.0)
                        Text("Rating : " + String(presenter.detailMovie?.voteAverage ?? 0))
                        if (presenter.detailMovie?.voteCount ?? 0 > 0) {
                            Text("Total Achievments : " + String(presenter.detailMovie?.voteCount ?? 0))
                        }
                        
                        Text("Description")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14, weight: .bold))
                            .padding(.top, 4.0)
                        let desc = presenter.detailMovie?.overview ?? ""
                        Text(desc)
                            .foregroundColor(Color.black)
                            .font(.system(size: 12, weight: .regular))
                            .padding(.top, 1.0)
                    }
                    .navigationBarItems(
                        trailing:
                            HStack {
                                if presenter.isFavorite {
                                    Button {
//                                        deleteFavorite()
                                    } label: {
                                        Image(systemName: "heart.fill").imageScale(.large)
                                            .tint(.blue)
                                    }
                                } else {
                                    Button {
//                                        addFavorite()
                                    } label: {
                                        Image(systemName: "heart").imageScale(.large)
                                            .tint(.blue)
                                    }
                                }
                            }
                    )
                    .navigationBarTitle("", displayMode: .inline)
                    .padding([.leading, .bottom, .trailing], 20)
                }
            }
        }
        .onAppear {
            
            self.presenter.getDetailMovie(id: movie.id ?? 0)
        }
//        .alert("Gagal memuat data!", isPresented: $isError) {
//            Button("OK", role: .cancel) {
//            }
//        }
    }
    
//    func addFavorite() {
//        gameProvider.createFavorite(FavoriteModel(id: Int16(game.id!), name: game.name, released: game.released, backgroundImage: game.backgroundImage, rating: game.rating)) { success in
//            if success {
//                isFavorite = true
//            }
//        }
//    }
//
//    func deleteFavorite() {
//        gameProvider.deleteFavorite(game.id!) { success in
//            if success {
//                isFavorite = false
//            }
//        }
//    }
//
//    func getFavorite() {
//        gameProvider.getFavorite(game.id!) { game in
//            isFavorite = true
//        }
//    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
