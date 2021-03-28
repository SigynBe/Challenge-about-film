//
//  ContentView.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 24/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var movies: Movie = Movie.init(id: 0,poster_path: "", original_title: "", popularity: 0, vote_count: 0, relese_data: "")
    @State var image: UIImage = UIImage(named: "image")!
    
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true){
                VStack{
                    Image(uiImage: image).resizable().frame(alignment: .center)
                        
                    HStack{
                        Spacer().frame(width: 20)
                        MovieDetails(movies: .init(
                                        id: movies.id,
                                        poster_path: movies.poster_path,
                                        original_title: movies.original_title,
                                        popularity: movies.popularity,
                                        vote_count: movies.vote_count,
                                        relese_data: movies.relese_data))
                    }
                    CountList(movies: [.init(id: movies.id, poster_path: movies.poster_path, original_title: movies.original_title, popularity: movies.popularity, vote_count: movies.vote_count, relese_data: movies.relese_data, genres: movies.genres)])
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
