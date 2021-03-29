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
                    
                    Image(uiImage: image).resizable().frame(alignment: .leading).aspectRatio(contentMode: .fit)
                    
                    Spacer().frame(width: 20)
                    
                    VStack{
                        Text("\(movies.original_title!)").foregroundColor(.white).multilineTextAlignment(.leading)
                        
                        HStack{
                            Text("\(movies.release_date!)").foregroundColor(.white).multilineTextAlignment(.leading)
                            
                            Spacer().frame(width: 8)
                            
                            Text("\(movies.genreText)").foregroundColor(.white)
                            
                        }
                        
                    }
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                        Spacer().frame(width: 5, alignment: .topTrailing)
                    }
                    
                }
                
                
            }
            
        }.onAppear{
            MovieService().getMovieImage(imageURL: self.movies.posterURL) { (moviePost) in
                self.image = moviePost
            }
        }
    }
}

