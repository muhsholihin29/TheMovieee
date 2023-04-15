//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import Combine

public protocol MovieRepository {
    associatedtype MoviesResponse
    associatedtype DetailResponse
    
    func getMovies(type: MovieType.RawValue) -> AnyPublisher<[MoviesResponse], Error>
    func getDetailMovie(id: Int) -> AnyPublisher<DetailResponse, Error>
}
