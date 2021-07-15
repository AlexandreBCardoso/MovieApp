//
//  FavoriteViewModelTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 15/07/21.
//

import Quick
import Nimble
@testable import MovieApp

class FavoriteViewModelTests: QuickSpec {
	
	override func spec() {
		describe("FavoriteViewModel") {
			
			context("Favorito Vazio") {
				it("retorna 1 para tratativa de Cell") {
					let viewModel = FavoriteViewModel(serviceLocal: CoreDataRepositoryMock())
					viewModel.fetchServiceLocal()
					
					expect(viewModel.numberOfFavorites) == 1
				}
				
				it("Valida lista vazia") {
					let viewModel = FavoriteViewModel(serviceLocal: CoreDataRepositoryMock())
					viewModel.fetchServiceLocal()
					
					expect(viewModel.checkIsEmpty()).to(beTrue())
				}
			}
			
			context("Favorito com Movie") {
				it("Valida Item Adicionado") {
					let serviceLocal = CoreDataRepositoryMock()
					let viewModel = FavoriteViewModel(serviceLocal: serviceLocal)
					serviceLocal.saveFavorite(viewModel: self.createFavoriteItem())
					viewModel.fetchServiceLocal()
					
					expect(viewModel.checkIsEmpty()).to(beFalse())
					expect(viewModel.numberOfFavorites) == 1
				}
				
				it("Obtem Item Favorito") {
					let serviceLocal = CoreDataRepositoryMock()
					let indexPath = IndexPath(row: 0, section: 0)
					let viewModel = FavoriteViewModel(serviceLocal: serviceLocal)
					serviceLocal.saveFavorite(viewModel: self.createFavoriteItem())
					viewModel.fetchServiceLocal()
					let favoriteItem = viewModel.getFavorite(indexPath: indexPath)
					
					expect(favoriteItem.original_title).to(contain("Thor"))
				}
				
				it("Delete Item Favorito") {
					let serviceLocal = CoreDataRepositoryMock()
					let viewModel = FavoriteViewModel(serviceLocal: serviceLocal)
					let favoriteItem = self.createFavoriteItem()
					serviceLocal.saveFavorite(viewModel: favoriteItem)
					viewModel.fetchServiceLocal()
					
					expect(viewModel.checkIsEmpty()).to(beFalse())
					
					viewModel.deleteFavorite(favorite: favoriteItem)
					viewModel.fetchServiceLocal()
					expect(viewModel.checkIsEmpty()).to(beTrue())
				}
			}
			
		}
	}
	
}


extension FavoriteViewModelTests {
	
	func createFavoriteItem() -> FavoriteModel {
		let favorite = FavoriteModel(pathImage: "", original_title: "Thor", year_release: "2021", overview: "Sobre")
		return favorite
	}
	
}
