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
			
			context("FetchMovie") {
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
			
			context("Busca Item Movie") {
				
				it("Valida preenchimendo de titulo") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0))
					viewModel.fetchMovie()
					
					let indexPath = IndexPath(row: 0, section: 0)
					let movieItem = viewModel.getItemMovie(indexPath: indexPath)
					
					expect(movieItem.original_title) != ""
				}
				
			}
			
			context("Check Favorite Movie") {
				it("") {
					let viewModel = MovieViewModel(service: NetworkRepositoryMock(typeTest: 0))
					viewModel.fetchMovie()
					
					let indexPath = IndexPath(row: 0, section: 0)
					let movieItem = viewModel.getItemMovie(indexPath: indexPath)
					
					expect(viewModel.checkFavorite(title: movieItem.original_title)).to(beFalse())
				}
			}
			
		}
	}
	
}
