//
//  ServiceRepository.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 01/07/21.
//

import Foundation

enum MovieError: Error {
	case badURL, requestFailed, unknown
}


protocol ServiceRepository {
	func fetchMovies(completion: @escaping(Result<Movie, MovieError>) -> Void)
	func fetchGenres(completion: @escaping(Result<Genres, MovieError>) -> Void)
}
