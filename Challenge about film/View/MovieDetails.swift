//
//  MovieDetails.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 24/03/21.
//

import SwiftUI

struct MovieDetails: View {
    @State var isPressed = false
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer().frame(width: 20)
                    Text("The Very Best Of \n Johnny Depp").bold().foregroundColor(.white)
                    
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
                    
                    Text("1.2K Likes").foregroundColor(.white)
                    
                    Spacer().frame(width: 23)
                    
                    Image(systemName: "video.fill").foregroundColor(.white)
                    
                    Spacer().frame(width: 5)
                    
                    Text("3333K views").foregroundColor(.white)
                    
                    Spacer()
                    
                }
                
                
            }
        }
        
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails().previewLayout(.sizeThatFits)
    }
}
