//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Foundation
import RealmSwift

public class FavoriteMovieModuleEntity: Object {
    
    @objc dynamic var movieId: Int = 0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0
    
    public override static func primaryKey() -> String? {
        return "movieId"
    }
}
