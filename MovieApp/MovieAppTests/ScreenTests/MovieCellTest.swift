//
//  MovieCellTest.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 11/07/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MovieApp

class MovieCellTest: QuickSpec {
	
	override func spec() {
		
		describe("UI - Movie Cell") {
						
			it("Cell com titulo curto e sem favorito") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/1.8)
				let view = MovieCell(frame: frame)
				let movieModel = self.createMovieModel(title: "Thor")
				let movielCellVM = self.createMovieCellModel(movie: movieModel, favorite: false)
				view.setupCell(viewModel: movielCellVM)
				expect(view) == snapshot("MovieCell-Short-Title-Unfavorite")
			}
			
			it("Cell com titulo curto e com favorito") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/1.8)
				let view = MovieCell(frame: frame)
				let movieModel = self.createMovieModel(title: "Thor")
				let movielCellVM = self.createMovieCellModel(movie: movieModel, favorite: true)
				view.setupCell(viewModel: movielCellVM)
				expect(view) == snapshot("MovieCell-Short-Title-Favorite")
			}
			
			it("Cell com titulo longo sem favorito") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/1.8)
				let view = MovieCell(frame: frame)
				let movieModel = self.createMovieModel(title: "Muler Maravilha 1844 - Ultimo Filme")
				let movielCellVM = self.createMovieCellModel(movie: movieModel, favorite: false)
				view.setupCell(viewModel: movielCellVM)
				expect(view) == snapshot("MovieCell-Long-Title-Unfavorite")
			}
			
			it("Cell com titulo longo com favorito") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/1.8)
				let view = MovieCell(frame: frame)
				let movieModel = self.createMovieModel(title: "Muler Maravilha 1844 - Ultimo Filme")
				let movielCellVM = self.createMovieCellModel(movie: movieModel, favorite: true)
				view.setupCell(viewModel: movielCellVM)
				expect(view) == snapshot("MovieCell-Long-Title-Favorite")
			}
			
		}
		
	}
	
}


extension MovieCellTest {
	
	func createMovieModel(title: String) -> MovieResult {
		let movie = MovieResult(adult: false, backdrop_path: "", genre_ids: [0], id: 123,
										original_language: "", original_title: title, overview: "",
										popularity: 0.0, poster_path: "", release_date: "", title: "",
										video: false, vote_average: 0.0, vote_count: 2)
		return movie
	}
	
	func createMovieCellModel(movie: MovieResult, favorite: Bool) -> MovieCellViewModel {
		let movieCell = MovieCellViewModel(movie: movie, favorite: favorite)
		return movieCell
	}
	
}
