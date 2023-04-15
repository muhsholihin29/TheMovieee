//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Combine

public protocol TvRepository {
    associatedtype TvsResponse
    associatedtype DetailResponse
    
    func getTvs(type: TvType.RawValue) -> AnyPublisher<[TvsResponse], Error>
    func getDetailTv(id: Int) -> AnyPublisher<DetailResponse, Error>
}
