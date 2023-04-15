//
//  File.swift
//  
//
//  Created by Sholi on 01/04/23.
//

import Foundation
import RealmSwift

public class FavoriteTvModuleEntity: Object{
    
    @objc dynamic var firstAirDate: String = ""
    var genreIDS = List<Int>()
    @objc dynamic var tvId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var voteAverage: Double = 0
    
    public override static func primaryKey() -> String? {
        return "tvId"
    }
}
