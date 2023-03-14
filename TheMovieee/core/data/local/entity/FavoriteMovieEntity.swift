//
//  FavoriteMovieEntity.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift

class FavoriteMovieEntity: Object {
    
    @objc dynamic var movieId: Int = 0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0
    
    override static func primaryKey() -> String? {
        return "movieId"
    }
}
