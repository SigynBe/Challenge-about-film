//
//  ContentView.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 24/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        VStack{
            Image("image").resizable().frame(height: 485).ignoresSafeArea().position(x: 160,y: 220)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
