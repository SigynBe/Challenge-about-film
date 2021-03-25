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
        VStack{
            HStack{
                Spacer().frame(width: 20)
                Text("The Very Best Of \n Johnny Depp").bold()
                
                Spacer()
                
                Button(action: {
                    print("Edit button was tapped")
                }){
                    Image(systemName: "heart").resizable().frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                
                Spacer().frame(width: 20)
            }
            
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails().previewLayout(.sizeThatFits)
    }
}
