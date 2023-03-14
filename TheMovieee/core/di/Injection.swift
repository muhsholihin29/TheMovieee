//
//  Injection.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideMovieRepository() -> MovieRepositoryProtocol {
        
        let realm = try? Realm()
        let local: LocalDataSource = LocalDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return MovieRepository.sharedInstance(local, remote)
    }
    
    private func provideTvRepository() -> TvRepositoryProtocol {
        
        let realm = try? Realm()
        let local: LocalDataSource = LocalDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return TvRepository.sharedInstance(local, remote)
    }
    
    func provideMovie() -> MovieUseCase {
        let repository = provideMovieRepository()
        return MovieInteractor(repository: repository)
    }
    
    func provideTv() -> TvUseCase {
        let repository = provideTvRepository()
        return TvInteractor(repository: repository)
    }
}
