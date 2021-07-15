//
//  DetailMovieViewModel.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 04/07/21.
//

import Foundation

protocol DetailMovieViewModelDelegate: AnyObject {
	func successGenres(listGenre: [Genre])
}

struct DetailMovieViewModel {
	
	let poster_path: String
	let pathImage: String
	let original_title: String
	let iconFavorite: String
	let favorite: Bool
	let release_date: String
	let genre_ids: [Int]
	let overview: String
	
	var year_release: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		if let date = dateFormatter.date(from: release_date) {
			let displayDate = DateFormatter()
			displayDate.dateFormat = "yyy"
			return displayDate.string(from: date)
		} else {
			return release_date
		}
	}
	
	private let service: ServiceRepository
	weak var delegate: DetailMovieViewModelDelegate?
	
	
	// MARK: - Initialize
	init(service: ServiceRepository = NetworkRepository(), poster_path: String, pathImage: String, original_title: String,
		  iconFavorite: String, favorite: Bool, release_date: String, genre_ids: [Int], overview: String) {
		self.service = service
		self.poster_path = poster_path
		self.pathImage = pathImage
		self.original_title = original_title
		self.iconFavorite = iconFavorite
		self.favorite = favorite
		self.release_date = release_date
		self.genre_ids = genre_ids
		self.overview = overview
	}
	
	// MARK: - Function
	func fetchGenres() {
		service.fetchGenres { (result) in
			switch result {
				case .success(let values):
					delegate?.successGenres(listGenre: values.genres)
					
				case .failure(let error):
					print("Error: \(error.localizedDescription)")
			}
		}
	}
	
	func descriptionGenre(genres: [Genre]) -> String {
		var listDescription: [String] = [String]()
		
		for value in self.genre_ids {
			if let index = genres.firstIndex(where: { $0.id == value }) {
				listDescription.append(genres[index].name)
			}
		}
		
		return listDescription.joined(separator: ", ")
	}
		
}
