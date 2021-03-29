//
//  MovieService.swift
//  Challenge about film
//
//  Created by Rebeca Pacheco on 26/03/21.
//

import Foundation
import UIKit
let urlMovie = URL(string: "https://api.themoviedb.org/3/movie/581389?api_key=9b127c5c7d182d6dddf80130109455f4")!
let urlMovieList = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b127c5c7d182d6dddf80130109455f4")!

class MovieService {
    var session: URLSession!

    init() {
        self.session = URLSession.shared
    }
    
    func getMovieList(completion: @escaping (MovieList) -> Void) {

        let request = URLRequest(url: urlMovieList)

        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }

            guard let json = data else {
                return
            }

            do {
                let movies = try JSONDecoder().decode(MovieList.self, from: json)

                DispatchQueue.main.async {
                    print(movies)
                    completion(movies)
                    
                }

            } catch {
                print(error)
                
            }
        }

        dataTask.resume()

    }

    
    func get(completion: @escaping (Movie) -> Void) {

        let request = URLRequest(url: urlMovie)

        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }

            guard let json = data else {
                return
            }

            do {
                let movies = try JSONDecoder().decode(Movie.self, from: json)

                DispatchQueue.main.async {
                    print(movies)
                    completion(movies)
                    
                }

            } catch {
                print(error)
                
            }
        }

        dataTask.resume()

    }
    
    func getMovieImage(imageURL: URL, completion: @escaping (UIImage) -> Void){
        
        let request = URLRequest(url: imageURL)

        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }

            guard let json = data else {
                return
            }

            do {
                let image = UIImage(data: json)
                
                DispatchQueue.main.async {
                    print(image)
                    completion(image!)
                    
                }

            } catch {
                print(error)
                
            }
        }

        dataTask.resume()
    }

}
