//
//  ModelMovie.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 26/03/21.
//

import Foundation



struct Movie: Decodable, Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path ?? "")")!
    }
    var poster_path: String?
    var original_title: String?
    var popularity: Double?
    var vote_count: Int?
    var release_date: String?
    
    var genres: [MovieGenre]?
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
}

struct MovieGenre: Decodable {
    
    var name: String
}
