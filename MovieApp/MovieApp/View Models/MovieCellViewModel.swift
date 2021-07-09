//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 04/07/21.
//

import Foundation

struct MovieCellViewModel {
	let poster_path: String
	let original_title: String
	
	var favorite: Bool
	var iconFavorite: String {
		return favorite ? "favorite_full_icon" : "favorite_gray_icon"
	}
	var pathImage: String {
		return "https://image.tmdb.org/t/p/w200\(poster_path)"
	}
	
	
	// MARK: - Initialize
	init(movie: MovieResult, favorite: Bool = false) {
		self.poster_path = movie.poster_path
		self.original_title = movie.original_title
		self.favorite = favorite
	}
	
}

