//
//  DetailMovieViewModelTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 14/07/21.
//

import Quick
import Nimble

@testable import MovieApp

class DetailMovieViewModelTests: QuickSpec {
	
	var listGenre = [Genre]()
	
	override func spec() {
		describe("DetailMovieViewModel") {
			
			context("Teste Year Release") {
				it("Year") {
					let viewModel = self.createVM(typeCall: 0)
					
					expect(viewModel.year_release).to(contain("2021"))
				}
			}
			
			context("Fetch Genre") {
				
				beforeEach {
					self.listGenre.removeAll()
				}
				
				it("Fetch - Erro Url") {
					let viewModel = self.createVM(typeCall: 1)
					viewModel.fetchGenres()
					
					expect(self.listGenre.count) == 0
				}
				
				it("Fetch - Erro Request") {
					let viewModel = self.createVM(typeCall: 2)
					viewModel.fetchGenres()
					
					expect(self.listGenre.count) == 0
				}
				
				it("Fetch - Erro Desconhecido") {
					let viewModel = self.createVM(typeCall: 3)
					viewModel.fetchGenres()
					
					expect(self.listGenre.count).to(beLessThanOrEqualTo(0))
				}
				
				it("Fetch - Sucesso") {
					var viewModel = self.createVM(typeCall: 0)
					viewModel.delegate = self
					viewModel.fetchGenres()
					
					expect(self.listGenre.count) > 0
				}
			}
			
			context("Description Genre") {
				it("Preenchimento com 1 ID") {
					var viewModel = self.createVM(typeCall: 0, ids: [53])
					viewModel.delegate = self
					viewModel.fetchGenres()
					let result = viewModel.descriptionGenre(genres: self.listGenre)
					
					expect(result) != ""
				}
				
				it("Preenchimento com +1 ID") {
					var viewModel = self.createVM(typeCall: 0)
					viewModel.delegate = self
					viewModel.fetchGenres()
					let result = viewModel.descriptionGenre(genres: self.listGenre)
					
					expect(result) != ""
					expect(result).to(contain(","))
				}
			}
			
		}
	}
	
}


extension DetailMovieViewModelTests {
	
	func createVM(typeCall: Int, ids: [Int] = [878,53,27]) -> DetailMovieViewModel {
		let detail = DetailMovieViewModel(service: NetworkRepositoryMock(typeTest: typeCall),
													 poster_path: "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg",
													 pathImage: "", original_title: "Lucca", iconFavorite: IconName.favorite,
													 favorite: false, release_date: "2021-05-21", genre_ids: ids, overview: "Following the events at home, the Abbott family now face the terrors of the outside world.")
		return detail
	}
	
}

extension DetailMovieViewModelTests: DetailMovieViewModelDelegate {
	
	func successGenres(listGenre: [Genre]) {
		self.listGenre = listGenre
	}
	
}
