//
//  MovieViewModelTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 14/07/21.
//

import Quick
import Nimble
@testable import MovieApp

class MovieViewModelTests: QuickSpec {
	
	override func spec() {
		describe("MovieViewModel") {
			
			context("Fetch Movie") {
				it("Teste de Sucesso") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0))
					viewModel.fetchMovie()
					
					expect(viewModel.numberOfMovies) > 0
				}
				
				it("Teste de Erro - Url") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 1))
					viewModel.fetchMovie()
					
					expect(viewModel.numberOfMovies) == 0
				}
				
				it("Teste de Erro - Request") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 2))
					viewModel.fetchMovie()
					
					expect(viewModel.numberOfMovies) == 0
				}
				
				it("Teste de Erro - Desconhecido") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 3))
					viewModel.fetchMovie()
					
					expect(viewModel.numberOfMovies) == 0
				}
				
			}
			
			context("Fetch Favorite") {
				it("Favorite vazio") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0), serviceLocal: CoreDataRepositoryMock())
					viewModel.fetchMovie()
					viewModel.fetchFavorite()
					
					let count = viewModel.numberOfMovies
					
					for index in 0..<count {
						let indexPath = IndexPath(row: index, section: 0)
						let result = viewModel.getItemMovie(indexPath: indexPath)
						
						let expected = viewModel.checkFavorite(title: result.original_title)
						
						expect(expected).to(beFalse())
					}
				}
				
				it("Salva Movie Favorito") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0),
															 serviceLocal: CoreDataRepositoryMock())
					viewModel.fetchMovie()
					let indexPath = IndexPath(row: 0, section: 0)
					let movieItem = viewModel.getItemMovie(indexPath: indexPath)
					
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beFalse())
					
					viewModel.saveFavorite(detailMovie: self.createDetailMovie(item: movieItem))
					viewModel.fetchFavorite()
					
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beTrue())
				}
				
				it("Deleta Movie Favorito") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0),
															 serviceLocal: CoreDataRepositoryMock())
					viewModel.fetchMovie()
					let indexPath = IndexPath(row: 0, section: 0)
					let movieItem = viewModel.getItemMovie(indexPath: indexPath)
					
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beFalse())
					
					viewModel.saveFavorite(detailMovie: self.createDetailMovie(item: movieItem))
					viewModel.fetchFavorite()
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beTrue())
					
					viewModel.deleteFavorite(detailMovie: self.createDetailMovie(item: movieItem))
					viewModel.fetchFavorite()
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beFalse())
				}
				
			}
			
		}
	}
	
}


extension MovieViewModelTests {
	
	func createDetailMovie(item: MovieResult) -> DetailMovieViewModel {
		let detail = DetailMovieViewModel(poster_path: item.poster_path, pathImage: "",
													 original_title: item.original_title, iconFavorite: "", favorite: false, release_date: item.release_date,
													 genre_ids: item.genre_ids, overview: item.overview)
		return detail
	}
	
}
