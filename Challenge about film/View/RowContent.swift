//
//  RowContent.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 25/03/21.
//

import SwiftUI

struct RowContent: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Color(.black).ignoresSafeArea()
                
                HStack(spacing: 0){
                    
                    Spacer().frame(width: 20)
                    
                    Image("image").resizable().frame(width: 80, height: 110)
                    
                    Spacer().frame(width: 20)
                    
                    VStack{
                        Text("Edward Scissorhands").foregroundColor(.white)
                        
                        HStack{
                            Text("1990").foregroundColor(.white)
                            
                            Spacer().frame(width: 8)
                            
                            Text("Drama, Fantasy").foregroundColor(.white)
                            
                        }
                        
                    }
                    
                    Spacer()
                }
            }
            
            HStack{
                Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                Spacer()
            }.position(x: 450, y: 240)
        }
    }
}

struct RowContent_Previews: PreviewProvider {
    static var previews: some View {
        RowContent().previewLayout(.sizeThatFits)
    }
}
