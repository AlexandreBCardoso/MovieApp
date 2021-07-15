//
//  CoreDataRepositoryMock.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

@testable import MovieApp
import CoreData

class CoreDataRepositoryMock: ServiceLocalRepository {
	
	// MARK: - Variable
	lazy var persistentContainer: NSPersistentContainer = {
	  let container = NSPersistentContainer(name: "MovieApp")
	  let description = NSPersistentStoreDescription()
		
	  description.url = URL(fileURLWithPath: "/dev/null")
	  container.persistentStoreDescriptions = [description]

	  container.loadPersistentStores(completionHandler: { _, error in
		 if let error = error as NSError? {
			fatalError("Failed to load stores: \(error), \(error.userInfo)")
		 }
	  })
	  return container
	}()
	
	
	// MARK: - Function
	func fetchFavorite() -> [NSManagedObject]? {
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteData")
		let managedContext = self.persistentContainer.viewContext
		
		do {
			let result = try managedContext.fetch(fetchRequest)
			return result
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
			return nil
		}
	}
	
	func saveFavorite(viewModel: FavoriteModel) {
		let managedContext = persistentContainer.viewContext
		guard let entity = NSEntityDescription.entity(forEntityName: "FavoriteData", in: managedContext)
		else { return }
		
		let newFavorite = NSManagedObject(entity: entity, insertInto: managedContext)
		newFavorite.setValue(viewModel.pathImage, forKeyPath: FieldsCoreData.pathImage)
		newFavorite.setValue(viewModel.original_title, forKeyPath: FieldsCoreData.title)
		newFavorite.setValue(viewModel.year_release, forKeyPath: FieldsCoreData.year)
		newFavorite.setValue(viewModel.overview, forKeyPath: FieldsCoreData.overview)
		
		do {
			try managedContext.save()
		} catch let error as NSError {
			print("Could not save. \(error), \(error.userInfo)")
		}
		
	}
	
	func deleteFavorite(title: String) {
		let managedContext = persistentContainer.viewContext
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteData")
		fetchRequest.predicate = NSPredicate(format: "\(FieldsCoreData.title) == %@", title)
		
		do {
			let result = try managedContext.fetch(fetchRequest)
			for favorite in result {
				managedContext.delete(favorite)
			}
			try managedContext.save()
		} catch _ {
			print("Could not delete")
		}
		
	}
}
