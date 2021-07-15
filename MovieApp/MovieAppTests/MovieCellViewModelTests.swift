//
//  MovieCellViewModelTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 14/07/21.
//

import Quick
import Nimble

@testable import MovieApp

class MovieCellViewModelTests: QuickSpec {
	
	override func spec() {
		describe("MovieCellViewModel") {
			
			context("Icon Name") {
				it("Unfavorite") {
					let viewModel = MovieCellViewModel(movie: self.createMovieResult(), favorite: false)
					
					expect(viewModel.iconFavorite).to(contain(IconName.unfavorite))
				}
				
				it("Favorite") {
					let viewModel = MovieCellViewModel(movie: self.createMovieResult(), favorite: true)
					
					expect(viewModel.iconFavorite).to(contain(IconName.favorite))
				}
			}
			
			context("Favorite") {
				it("false") {
					let viewModel = MovieCellViewModel(movie: self.createMovieResult(), favorite: false)
					
					expect(viewModel.favorite).to(beFalse())
				}
				
				it("True") {
					let viewModel = MovieCellViewModel(movie: self.createMovieResult(), favorite: true)
					
					expect(viewModel.favorite).to(beTrue())
				}
			}
			
			context("Path Image") {
				it("path") {
					let movie = self.createMovieResult()
					let viewModel = MovieCellViewModel(movie: movie)
					let expectedPoster = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
					
					expect(viewModel.pathImage).to(contain(expectedPoster))
				}
			}
			
		}
	}
	
}


extension MovieCellViewModelTests {
	
	func createMovieResult() -> MovieResult {
		let result = MovieResult(adult: false, backdrop_path: "/z2UtGA1WggESspi6KOXeo66lvLx.jpg",
										 genre_ids: [878,53,27], id: 520763,
										 original_language: "en", original_title: "A Quiet Place Part II",
										 overview: "Following the events at home, the Abbott family now face the terrors of the outside world. Forced to venture into the unknown, they realize that the creatures that hunt by sound are not the only threats that lurk beyond the sand path.",
										 popularity: 1738.065, poster_path: "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg",
										 release_date: "2021-05-21", title: "A Quiet Place Part II",
										 video: false, vote_average: 7.8, vote_count: 1730)
		return result
	}
	
}
