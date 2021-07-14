//
//  CoreDataRepositoryMock.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

@testable import MovieApp
import CoreData

class CoreDataRepositoryMock: ServiceLocalRepository {
	
	func fetchFavorite() -> [NSManagedObject]? {
		return nil
	}
	
	func saveFavorite(viewModel: FavoriteModel) {
	}
	
	func deleteFavorite(title: String) {
	}

}
