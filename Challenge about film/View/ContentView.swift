//
//  ContentView.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 24/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var movies: Movie = Movie.init(id: 0,poster_path: "", original_title: "", popularity: 0, vote_count: 0, release_date: "")
    @State var image: UIImage = UIImage(named: "image")!
    
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true){
                VStack{
                    
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fill)
                        
                    HStack{
                        Spacer().frame(width: 20)
                        MovieDetails(movies: .init(
                                        id: movies.id,
                                        poster_path: movies.poster_path,
                                        original_title: movies.original_title,
                                        popularity: movies.popularity,
                                        vote_count: movies.vote_count,
                                        release_date: movies.release_date))
                    }
                    CountList(movies: [.init(id: movies.id, poster_path: movies.poster_path, original_title: movies.original_title, popularity: movies.popularity, vote_count: movies.vote_count, release_date: movies.release_date, genres: movies.genres)])
                    
                    Spacer()
                }
            }.ignoresSafeArea()
            
            
        }.onAppear{
            MovieService().get{ movie in
                self.movies = movie
                
                MovieService().getMovieImage(imageURL: self.movies.posterURL) { (moviePost) in
                    self.image = moviePost
                }
            }
        }
        
    }
}

