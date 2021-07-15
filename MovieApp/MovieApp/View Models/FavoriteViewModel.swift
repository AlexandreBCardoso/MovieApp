//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 07/07/21.
//

import Foundation

class FavoriteViewModel {
	
	private var listFavorite: [FavoriteModel] = []
	
	var numberOfFavorites: Int {
		if listFavorite.isEmpty {
			return 1
		}
		return listFavorite.count
	}
	
	private let serviceLocal: ServiceLocalRepository
	
	
	// MARK: - Initialize
	init(serviceLocal: ServiceLocalRepository = CoreDataRepository()) {
		self.serviceLocal = serviceLocal
	}
	
	
	// MARK: - Function
	func fetchServiceLocal() {
		if let listObject = serviceLocal.fetchFavorite() {
			self.listFavorite.removeAll()
			let result = listObject.compactMap{
				FavoriteModel(pathImage: ($0.value(forKeyPath: FieldsCoreData.pathImage) as? String) ?? "",
								  original_title: ($0.value(forKeyPath: FieldsCoreData.title) as? String) ?? "",
								  year_release: ($0.value(forKeyPath: FieldsCoreData.year) as? String) ?? "",
								  overview: ($0.value(forKeyPath: FieldsCoreData.overview) as? String) ?? "")
			}
			self.listFavorite = result
		}
	}
	
	func deleteFavorite(favorite: FavoriteModel) {
		serviceLocal.deleteFavorite(title: favorite.original_title)
	}
	
	func getFavorite(indexPath: IndexPath) -> FavoriteModel {
		return listFavorite[indexPath.row]
	}
	
	func checkIsEmpty() -> Bool {
		return listFavorite.isEmpty
	}
	
}
