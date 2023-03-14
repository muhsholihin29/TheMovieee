//
//  CustomeError+Ext.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

enum MovieType: String {
    case POPULAR = "popular_movie"
    case TOP_RATED = "top_rated_movie"
    case UPCOMING = "upcoming_movie"
    case NOW_PLAYING = "now_playing_movie"
}

enum TvType: String {
    case POPULAR = "popular_tv"
    case TOP_RATED = "top_rated_tv"
    case AIRING_TODAY = "airing_today_tv"
    case ON_THE_AIR = "on_the_air_tv"
}

enum URLError: LocalizedError {
    
    case invalidResponse
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
            case .invalidResponse: return "The server responded with garbage."
            case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
    
}

enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    var errorDescription: String? {
        switch self {
            case .invalidInstance: return "Database can't instance."
            case .requestFailed: return "Your request failed."
        }
    }
    
}
