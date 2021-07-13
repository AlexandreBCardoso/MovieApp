//
//  NetworkRepository.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 01/07/21.
//

import Foundation

class NetworkRepository: ServiceRepository {
	
	func fetchMovies(completion: @escaping (Result<Movie, MovieError>) -> Void) {
		
		guard let serverUrl = Bundle.main.object(forInfoDictionaryKey: ServerURL.trending) as? String,
				let url = URL(string: serverUrl)
		else { return completion(.failure(.badURL)) }
		
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data, error == nil else { return completion(.failure(.requestFailed)) }
			
			do {
				let movie = try JSONDecoder().decode(Movie.self, from: data)
				completion(.success(movie))
				
			} catch let erro {
				print(erro.localizedDescription)
				completion(.failure(.unknown))
			}
		}
		
		task.resume()
	}
	
	func fetchGenres(completion: @escaping (Result<Genres, MovieError>) -> Void) {
		
		guard let serverUrlGenre = Bundle.main.object(forInfoDictionaryKey: ServerURL.genre) as? String,
				let url = URL(string: serverUrlGenre) else { return completion(.failure(.badURL)) }  
		
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data, error == nil else { return completion(.failure(.requestFailed)) }
			
			do {
				let genres = try JSONDecoder().decode(Genres.self, from: data)
				completion(.success(genres))
				
			} catch let erro {
				print(erro.localizedDescription)
				completion(.failure(.unknown))
			}
		}
		
		task.resume()
	}
	
}
