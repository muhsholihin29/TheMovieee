//
//  ContentView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moviePresenter: MoviePresenter
    @EnvironmentObject var tvPresenter: TvPresenter
    
    var body: some View {
        NavigationView {
            TabView {
                MovieListView(presenter: moviePresenter)
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Game")
                    }
                TvListView(presenter: tvPresenter)
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                    }
                
            }
            .navigationBarTitle(Text("TheMovieee"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
