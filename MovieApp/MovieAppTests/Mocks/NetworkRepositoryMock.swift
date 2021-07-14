//
//  NetworkRepositoryMock.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

@testable import MovieApp

class NetworkRepositoryMock: ServiceRepository {
	
	func fetchMovies(completion: @escaping (Result<Movie, MovieError>) -> Void) {
		completion(.failure(.badURL))
	}
	
	func fetchGenres(completion: @escaping (Result<Genres, MovieError>) -> Void) {
		completion(.failure(.badURL))
	}

}
