//
//  RowContent.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 25/03/21.
//

import SwiftUI

struct RowContent: View {
    @State var movies: Movie
    @State var image: UIImage = UIImage(named: "image")!
    
    
    var body: some View {
        
        GeometryReader{ geo in
            ZStack{
                Color(.black).ignoresSafeArea()
                
                HStack(spacing: 0){
                    
                    Spacer().frame(width: 20)
                    
                    Image(uiImage: image).resizable().frame(width: 80, height: 110)
                    
                    Spacer().frame(width: 20)
                    
                    VStack{
                        Text("\(movies.original_title!)").foregroundColor(.white)
                        
                        HStack{
                            Text("\(movies.release_date!)").foregroundColor(.white)
                            
                            Spacer().frame(width: 8)
                            
                            Text("\(movies.genreText)").foregroundColor(.white)
                            
                        }
                        
                    }
                    
                    Spacer()
                }
            }
            
            HStack{
                Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                Spacer()
            }.position(x: 450, y: 240)
        }.onAppear{
            MovieService().getMovieImage(imageURL: self.movies.posterURL) { (moviePost) in
                self.image = moviePost
            }
        }
    }
}

