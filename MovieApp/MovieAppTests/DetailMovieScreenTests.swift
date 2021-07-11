//
//  DetailMovieScreenTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 11/07/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MovieApp

class DetailMovieScreenTests: QuickSpec {
	
	override func spec() {
		describe("The UI") {
			
			it("Screen Detail Unfavorite") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
				let view = DetailMovieScreen(frame: frame)
				let detailVM = self.createVM(favorite: false)
				view.titleLabel.text = detailVM.original_title
				view.yearLabel.text = detailVM.year_release
				view.summaryLabel.text = detailVM.overview
				view.setupFavoriteIcon(detailVM.favorite)
				view.setupFavoriteButton(detailVM.iconFavorite)
				expect(view) == snapshot("DetailMovieScreen-Unfavorite")
			}
			
			it("Screen Detail Favorite") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
				let view = DetailMovieScreen(frame: frame)
				let detailVM = self.createVM(favorite: true)
				view.titleLabel.text = detailVM.original_title
				view.yearLabel.text = detailVM.year_release
				view.summaryLabel.text = detailVM.overview
				view.setupFavoriteIcon(detailVM.favorite)
				view.setupFavoriteButton(detailVM.iconFavorite)
				expect(view) == snapshot("DetailMovieScreen-Favorite")
			}
			
		}
	}
	
}


extension DetailMovieScreenTests {
	
	
	func createVM(favorite: Bool) -> DetailMovieViewModel {
		var icon: String
		if favorite {
			icon = "favorite_full_icon"
		} else {
			icon = "favorite_gray_icon"
		}
		let detail = DetailMovieViewModel(poster_path: "", pathImage: "", original_title: "Thor",
													 iconFavorite: icon, favorite: favorite, release_date: "2021-09-10",
													 genre_ids: [28,12,16], overview: "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.")
		return detail
	}
}
