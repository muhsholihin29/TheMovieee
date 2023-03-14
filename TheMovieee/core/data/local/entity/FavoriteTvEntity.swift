//
//  FavoriteTvEntity.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift

class FavoriteTvEntity: Object{
    
    @objc dynamic var firstAirDate: String = ""
    var genreIDS = List<Int>()
    @objc dynamic var tvId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var voteAverage: Double = 0
    
    override static func primaryKey() -> String? {
        return "tvId"
    }
}
