//
//  FavoriteCellTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 11/07/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MovieApp

class FavoriteCellTests: QuickSpec {
	
	override func spec() {
		describe("The UI") {
			
			it("Cell Favorite Short Title") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
				let view = FavoriteCell(style: .default, reuseIdentifier: nil)
				view.frame = frame
				let favoriteItem = self.createFavorite(title: "Thor")
				view.setupCell(viewModel: favoriteItem)
				
				expect(view) == snapshot("FavoriteCell-Short-Title")
			}
			
			it("Cell Favorite Short Title") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
				let view = FavoriteCell(style: .default, reuseIdentifier: nil)
				view.frame = frame
				let favoriteItem = self.createFavorite(title: "The Conjuring: The Devil Made Me Do It")
				view.setupCell(viewModel: favoriteItem)
				
				expect(view) == snapshot("FavoriteCell-Long-Title")
			}
			
		}
	}
	
}


extension FavoriteCellTests {
	
	func createFavorite(title: String) -> FavoriteModel {
		let favorite = FavoriteModel(pathImage: "", original_title: title, year_release: "2021", overview: "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.")
		return favorite
	}
	
}
