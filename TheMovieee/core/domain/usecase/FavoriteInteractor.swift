//
//  FavoriteInteractor.swift
//  TheMovieee
//
//  Created by Sholi on 15/03/23.
//

import Combine

protocol FavoriteUseCase {
    func getFavoriteMovies() -> AnyPublisher<[Movie], Error>
    func getFavoriteTvs() -> AnyPublisher<[Tv], Error>
}

class FavoriteInteractor: FavoriteUseCase {

    private let movieRepository: MovieRepositoryProtocol
    private let tvRepository: TvRepositoryProtocol

    required init(movieRepository: MovieRepositoryProtocol, tvRepository: TvRepositoryProtocol) {
        self.movieRepository = movieRepository
        self.tvRepository = tvRepository
    }

    func getFavoriteMovies() -> AnyPublisher<[Movie], Error> {
        movieRepository.getAllFavoriteMovies()
    }

    func getFavoriteTvs() -> AnyPublisher<[Tv], Error> {
        tvRepository.getAllFavoriteTvs()
    }
}
