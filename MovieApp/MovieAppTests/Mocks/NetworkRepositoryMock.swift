//
//  NetworkRepositoryMock.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

import Foundation
@testable import MovieApp

class NetworkRepositoryMock: ServiceRepository {
	
	var typeTest: Int
	
	init(typeTest: Int) {
		self.typeTest = typeTest
	}
	
	func fetchMovies(completion: @escaping (Result<Movie, MovieError>) -> Void) {
		
//		guard let urlString = Bundle.main.path(forResource: "trending", ofType: "json"),
//				let url = URL(string: urlString)
//		else { return completion(.failure(.badURL)) }
//
//		guard let json = try? String(contentsOf: url, encoding: .utf8),
//				let jsonData = json.data(using: .utf8)
//		else { return completion(.failure(.requestFailed)) }
//
//		do {
//			let result = try JSONDecoder().decode(Movie.self, from: jsonData)
//			completion(.success(result))
//		} catch let error {
//			print(error.localizedDescription)
//			completion(.failure(.unknown))
//		}
		
		switch typeTest {
			case 0: completion(.success(createMovie()))
			case 1: completion(.failure(.badURL))
			case 2: completion(.failure(.requestFailed))
			case 3: completion(.failure(.unknown))
			default: break
		}
		
	}
	
	func fetchGenres(completion: @escaping (Result<Genres, MovieError>) -> Void) {
		
//		guard let urlString = Bundle.main.path(forResource: "genre", ofType: "json"),
//				let url = URL(string: urlString)
//		else { return completion(.failure(.badURL)) }
//
//		guard let json = try? String(contentsOf: url, encoding: .utf8),
//				let jsonData = json.data(using: .utf8)
//		else { return completion(.failure(.requestFailed)) }
//
//		do {
//			let result = try JSONDecoder().decode(Genres.self, from: jsonData)
//			completion(.success(result))
//		} catch let error {
//			print(error.localizedDescription)
//			completion(.failure(.unknown))
//		}
		
		switch typeTest {
			case 0: completion(.success(createGenre()))
			case 1: completion(.failure(.badURL))
			case 2: completion(.failure(.requestFailed))
			case 3: completion(.failure(.unknown))
			default: break
		}
		
	}
	
}

extension NetworkRepositoryMock {
	
	func createMovie() -> Movie {
		let movie = Movie(page: 1, results: [
			MovieResult(adult: false, backdrop_path: "/z2UtGA1WggESspi6KOXeo66lvLx.jpg",
							genre_ids: [878,53,27], id: 520763,
							original_language: "en", original_title: "A Quiet Place Part II",
							overview: "Following the events at home, the Abbott family now face the terrors of the outside world. Forced to venture into the unknown, they realize that the creatures that hunt by sound are not the only threats that lurk beyond the sand path.",
							popularity: 1738.065, poster_path: "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg",
							release_date: "2021-05-21", title: "A Quiet Place Part II",
							video: false, vote_average: 7.8, vote_count: 1730),
			MovieResult(adult: false, backdrop_path: "/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
							genre_ids: [16,35,10751,14], id: 508943,
							original_language: "en", original_title: "Luca",
							overview: "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.",
							popularity: 3858.007, poster_path: "/jTswp6KyDYKtvC52GbHagrZbGvD.jpg",
							release_date: "2021-06-17", title: "Luca", video: false,
							vote_average: 8.1, vote_count: 2637)
		])
		
		return movie
	}
	
	func createGenre() -> Genres {
		let genres = Genres(genres: [
			Genre(id: 878, name: "Science Fiction"),
			Genre(id: 53, name: "Thriller"),
			Genre(id: 27, name: "Horror"),
			Genre(id: 16, name: "Animation"),
			Genre(id: 35, name: "Comedy"),
			Genre(id: 10751, name: "Family"),
			Genre(id: 14, name: "Fantasy")
		])
		
		return genres
	}
	
}
