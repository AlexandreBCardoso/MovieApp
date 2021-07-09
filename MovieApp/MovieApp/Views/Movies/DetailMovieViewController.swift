//
//  DetailMovieViewController.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 04/07/21.
//

import UIKit

protocol DetailMovieViewControllerDelegate: AnyObject {
	func updateFavorite(detailMovie: DetailMovieViewModel, favorite: Bool)
}

final class DetailMovieViewController: UIViewController {
	
	// MARK: - Variable
	private let detailMovieScreen = DetailMovieScreen()
	
	var viewModel: DetailMovieViewModel? {
		didSet {
			detailMovieScreen.titleLabel.text = viewModel?.original_title
			detailMovieScreen.yearLabel.text = viewModel?.year_release
			detailMovieScreen.summaryLabel.text = viewModel?.overview
			if let url = URL(string: viewModel?.pathImage ?? "") {
				self.detailMovieScreen.movieImageView.loadImage(from: url)
			}
			viewModel?.fetchGenres()
		}
	}
	
	weak var delegate: DetailMovieViewControllerDelegate?
	
	
	// MARK: - Life cycle
	override func loadView() {
		self.view = detailMovieScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Movie"
		
		tabBarController?.tabBar.isHidden = true
		viewModel?.delegate = self
		setupScreen()
	}
	
	private func setupScreen() {
		detailMovieScreen.setupFavoriteButton(viewModel?.iconFavorite ?? "")
		detailMovieScreen.setupFavoriteIcon(viewModel?.favorite ?? false)
		detailMovieScreen.delegate = self
	}
	
}


// MARK: - Extension DetailMovieViewModelDelegate
extension DetailMovieViewController: DetailMovieViewModelDelegate {
	
	func successGenres(listGenre: [Genre]) {
		DispatchQueue.main.async {
			self.detailMovieScreen.genreLabel.text = self.viewModel?.descriptionGenre(genres: listGenre)
		}
	}
	
}


// MARK: - Extension
extension DetailMovieViewController: DetailMovieScreenDelegate {
	
	func updateFavorite(favorite: Bool) {
		if let detailMovie = viewModel {
			self.delegate?.updateFavorite(detailMovie: detailMovie, favorite: favorite)
		}
	}
	
}
