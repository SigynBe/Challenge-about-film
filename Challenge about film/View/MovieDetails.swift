//
//  MovieDetails.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 24/03/21.
//

import SwiftUI

struct MovieDetails: View {
    @State var isPressed = false
    
    @State var movies: Movie
    
    var body: some View {
        ZStack{

            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
//                    Spacer().frame(width: 20)
                    Text(movies.original_title!).bold().foregroundColor(.white)
                    
                    Spacer()
                    
                    if isPressed == false{
                        Button(action: {
                            isPressed = true
                            print("Edit button was tapped")
                            
                        }){
                            Image(systemName: "heart").resizable().foregroundColor(.white).frame(width: 30, height: 30, alignment: .center)
                            Spacer().frame(width: 20)
                        }
                    }else{
                        Button(action: {
                            isPressed = false
                            print("Edit button was tapped")
                        }){
                            Image(systemName: "heart.fill").resizable().foregroundColor(.white).frame(width: 30, height: 30, alignment: .center)
                            
                            Spacer().frame(width: 20)
                        }
                        
                        
                    }
                    
                }
                
                Spacer()
                    .frame(width: 20, height: 20)
                
                HStack{
                    Spacer().frame(width: 20)
                    Image(systemName: "heart.fill").foregroundColor(.white)
                    
                    Spacer().frame(width: 5)
                    
                    Text("\(movies.vote_count!)").foregroundColor(.white)
                    
                    Spacer().frame(width: 23)
                    
                    Image(systemName: "video.fill").foregroundColor(.white)
                    
                    Spacer().frame(width: 5)
                    
                    Text("\(movies.popularity!)").foregroundColor(.white)
                    
                    Spacer()
                    
                }
                
                
            }
        }.onAppear{
            MovieService().get{ movie in
                self.movies = movie
            }
            
        }
        
    }

}
//struct MovieDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetails(movies: movies[1]).previewLayout(.sizeThatFits)
//    }
//}
