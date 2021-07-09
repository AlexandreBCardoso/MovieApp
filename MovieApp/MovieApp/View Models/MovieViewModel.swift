//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 01/07/21.
//

import Foundation

protocol MovieViewModelDelegate: AnyObject {
	func successMovie()
	func errorMovie()
}

class MovieViewModel {
	
	// MARK: - Variable
	private var movieResult = [MovieResult]()
	private var listFavorite = [FavoriteModel]()
	private let service: ServiceRepository
	private let serviceLocal: ServiceLocalRepository
	private weak var delegate: MovieViewModelDelegate?
	
	var numberOfMovies: Int {
		return movieResult.count
	}
		
	
	// MARK: - Initialize
	init(service: ServiceRepository = NetworkRepository(), serviceLocal: ServiceLocalRepository = CoreDataRepository()) {
		self.service = service
		self.serviceLocal = serviceLocal
	}
	
	
	// MARK: - Function
	func delegate(delegate: MovieViewModelDelegate) {
		self.delegate = delegate
	}
	
	func fetchMovie() {
		service.fetchMovies { result in
			switch result {
				case .success(let movie):
					self.movieResult = movie.results
					self.delegate?.successMovie()
				case .failure(_):
					self.delegate?.errorMovie()
			}
		}
	}
	
	func fetchFavorite() {
		if let listObject = serviceLocal.fetchFavorite() {
			self.listFavorite.removeAll()
			let result = listObject.compactMap{
				FavoriteModel(pathImage: ($0.value(forKeyPath: "pathImage") as? String) ?? "",
								  original_title: ($0.value(forKeyPath: "title") as? String) ?? "",
								  year_release: ($0.value(forKeyPath: "year") as? String) ?? "",
								  overview: ($0.value(forKeyPath: "overview") as? String) ?? "")
			}
			self.listFavorite = result
		}
	}
	
	func getItemMovie(indexPath: IndexPath) -> MovieResult {
		return movieResult[indexPath.row]
	}
		
	func checkFavorite(title: String) -> Bool {
		return self.listFavorite.contains(where: {$0.original_title == title})
	}
	
	func saveFavorite(detailMovie: DetailMovieViewModel) {
		let favorite = FavoriteModel(pathImage: detailMovie.pathImage,
											  original_title: detailMovie.original_title,
											  year_release: detailMovie.year_release,
											  overview: detailMovie.overview)
		serviceLocal.saveFavorite(viewModel: favorite)
	}
	
	func deleteFavorite(detailMovie: DetailMovieViewModel) {
		serviceLocal.deleteFavorite(title: detailMovie.original_title)
	}
	
}
