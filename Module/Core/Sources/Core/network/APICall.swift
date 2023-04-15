//
//  APICall.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation

struct API {
    
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let apiKey = "a65ec405c3a90543b914c39e1a1faa00"
    static let image = "https://image.tmdb.org/t/p/w500/"
}

protocol Endpoint {
    
    var url: String { get }
    
}

public enum Endpoints {
    
    public enum Gets: Endpoint {
        case popularMovies
        case nowPlayingMovies
        case topRatedMovies
        case upcomingMovies
        case detailMovie(id: Int)
        
        case popularTv
        case onTheAirTv
        case topRatedTv
        case airingTodayTv
        case detailTv(id: Int)
        
        public var url: String {
            switch self {
                case .popularMovies: return "\(API.baseUrl)movie/popular?api_key=\(API.apiKey)"
                case .nowPlayingMovies: return "\(API.baseUrl)movie/now_playing?api_key=\(API.apiKey)"
                case .topRatedMovies: return "\(API.baseUrl)movie/top_rated?api_key=\(API.apiKey)"
                case .upcomingMovies: return "\(API.baseUrl)movie/upcoming?api_key=\(API.apiKey)"
                case .detailMovie(let id): return "\(API.baseUrl)movie/\(id)?api_key=\(API.apiKey)"
                    
                case .popularTv: return "\(API.baseUrl)tv/popular?api_key=\(API.apiKey)"
                case .topRatedTv: return "\(API.baseUrl)tv/top_rated?api_key=\(API.apiKey)"
                case .onTheAirTv: return "\(API.baseUrl)tv/on_the_air?api_key=\(API.apiKey)"
                case .airingTodayTv: return "\(API.baseUrl)tv/airing_today?api_key=\(API.apiKey)"
                case .detailTv(let id): return "\(API.baseUrl)tv/\(id)?api_key=\(API.apiKey)"
                    
            }
        }
    }
    
    
}
