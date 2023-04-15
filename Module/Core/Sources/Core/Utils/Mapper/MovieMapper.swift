//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import Foundation

public protocol MovieMapper {
    associatedtype Response
    associatedtype MovieDomain
    associatedtype DetailResponse
    associatedtype DetailDomain
    
    func transformMovieResponseToDomain(response: Response) -> MovieDomain
    func transformDetailMovieResponseToDomain(response: DetailResponse) -> DetailDomain
}
