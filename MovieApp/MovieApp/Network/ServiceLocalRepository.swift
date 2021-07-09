//
//  CoreDataRepository.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 07/07/21.
//

import CoreData

protocol ServiceLocalRepository {
	func fetchFavorite() -> [NSManagedObject]?
	func saveFavorite(viewModel: FavoriteModel)
	func deleteFavorite(title: String)
}
