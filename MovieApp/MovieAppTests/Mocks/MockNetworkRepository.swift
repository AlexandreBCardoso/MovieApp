//
//  MockNetworkRepository.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 12/07/21.
//

import Foundation
@testable import MovieApp


class MockNetworkRepository {
	
	var shouldReturnError = false
	
	convenience init() {
		self.init(false)
	}
	
	init(_ shouldReturnError: Bool) {
		self.shouldReturnError = shouldReturnError
	}
	
	func createMovie() -> Movie {
		return Movie(page: 1, results: [
			MovieResult(adult: false, backdrop_path: "", genre_ids: [0], id: 123, original_language: "",
							original_title: "Filme 01", overview: "Filme 01", popularity: 0, poster_path: "", release_date: "",
							title: "", video: false, vote_average: 0, vote_count: 0),
			MovieResult(adult: false, backdrop_path: "", genre_ids: [0], id: 123, original_language: "",
							original_title: "Filme 02", overview: "Filme 02", popularity: 0, poster_path: "", release_date: "",
							title: "", video: false, vote_average: 0, vote_count: 0)
		])
	}
	
}


extension MockNetworkRepository: ServiceRepository {
	
	func fetchMovies(completion: @escaping (Result<Movie, MovieError>) -> Void) {
		
		if shouldReturnError {
			completion(.failure(.badURL))
		}
		completion(.success(createMovie()))
		
	}
	
	func fetchGenres(completion: @escaping (Result<Genres, MovieError>) -> Void) {
		completion(.failure(.badURL))
	}
	
}
