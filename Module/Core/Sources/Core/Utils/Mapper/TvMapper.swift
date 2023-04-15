//
//  File.swift
//  
//
//  Created by Sholi on 13/04/23.
//

import Foundation

public protocol TvMapper {
    associatedtype Response
    associatedtype TvDomain
    associatedtype DetailResponse
    associatedtype DetailDomain
    
    func transformTvResponseToDomain(response: Response) -> TvDomain
    func transformDetailTvResponseToDomain(response: DetailResponse) -> DetailDomain
}
