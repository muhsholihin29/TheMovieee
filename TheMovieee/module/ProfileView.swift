//
//  ProfileView.swift
//  TheMovieee
//
//  Created by Sholi on 12/03/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image("profile")
                .resizable()
                .clipShape(Circle())
                .frame(width: 135.0, height: 135.0)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                .shadow(radius: 10)
            
            Text("Muhammad Sholihin").font(.title).padding(.top,18)
            
            HStack{
                Image("gmail-logo")
                    .resizable()
                    .frame(width: 18.0, height: 18.0)
                Text("muhsholihin29@gmail.com").font(.subheadline)
            }
            
            HStack{
                Image("github-logo")
                    .resizable()
                    .frame(width: 30.0, height: 18.0)
                Text("muhsholihin29").font(.subheadline)
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

