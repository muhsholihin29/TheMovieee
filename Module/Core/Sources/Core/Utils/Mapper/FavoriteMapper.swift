//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Foundation

public protocol FavoriteMapper {
    associatedtype MovieEntity
    associatedtype MovieDomain
    associatedtype TvEntity
    associatedtype TvDomain
    
    func transformMovieEntityToDomain(entity: MovieEntity) -> MovieDomain
    func transformMovieDomainToEntity(domain: MovieDomain) -> MovieEntity
    func transformTvEntityToDomain(entity: TvEntity) -> TvDomain
    func transformTvDomainToEntity(domain: TvDomain) -> TvEntity
}
