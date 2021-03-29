//
//  CountList.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 28/03/21.
//

import SwiftUI

struct CountList: View {
    @State var movies: [Movie] = []
    var body: some View {
       
            ForEach(movies, id: \.id){ movie in
                RowContent(movies: movie).padding()
            }
        .onAppear{
            MovieService().getMovieList{ (movie) in
                self.movies = movie.results
                
            }
        }
    }
}
