//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 29/06/21.
//

import UIKit

final class MoviesViewController: UIViewController {
	
	// MARK: - Variable
	private let cardMovieScreen = CardMovieScreen()
	private var viewModel = MovieViewModel()
	
	
	// MARK: - Life cycle
	override func loadView() {
		self.view = cardMovieScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupCardMovieScreen()
		setupViewModel()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.tabBar.isHidden = false
		viewModel.fetchFavorite()
		cardMovieScreen.collectionView.reloadData()
	}
	
	
	// MARK: - Function
	private func setupCardMovieScreen() {
		cardMovieScreen.delegate(delegate: self)
		cardMovieScreen.dataSource(dataSource: self)
		cardMovieScreen.spinner.hidesWhenStopped = true
		cardMovieScreen.spinner.startAnimating()
	}
	
	private func setupViewModel() {
		viewModel.delegate(delegate: self)
		viewModel.fetchMovie()
	}
	
}


// MARK: - Extension CollectionView
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.width/1.8)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfMovies
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let movie = viewModel.getItemMovie(indexPath: indexPath)
		let cellViewModel = MovieCellViewModel(movie: movie, favorite: viewModel.checkFavorite(title: movie.original_title))
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier,
																	 for: indexPath) as? MovieCell
		
		cell?.setupCell(viewModel: cellViewModel)
		
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let movie = viewModel.getItemMovie(indexPath: indexPath)
		let favorite = viewModel.checkFavorite(title: movie.original_title)
		let cellViewModel = MovieCellViewModel(movie: viewModel.getItemMovie(indexPath: indexPath),
															favorite: favorite)
		
		let detailViewController = DetailMovieViewController()
		detailViewController.delegate = self
		detailViewController.viewModel = DetailMovieViewModel(poster_path: cellViewModel.poster_path,
																				pathImage: cellViewModel.pathImage,
																				original_title: cellViewModel.original_title,
																				iconFavorite: cellViewModel.iconFavorite,
																				favorite: cellViewModel.favorite,
																				release_date: movie.release_date,
																				genre_ids: movie.genre_ids,
																				overview: movie.overview)
		
		navigationController?.pushViewController(detailViewController, animated: true)
	}
	
}


// MARK: - Extension MovieViewModel
extension MoviesViewController: MovieViewModelDelegate {
	
	func successMovie() {
		DispatchQueue.main.async {
			self.cardMovieScreen.spinner.stopAnimating()
			self.cardMovieScreen.collectionView.reloadData()
		}
	}
	
	func errorMovie() {
		print(#function)
	}
	
}


// MARK: - Extension DetailMovieViewControllerDelegate
extension MoviesViewController: DetailMovieViewControllerDelegate {
	
	func updateFavorite(detailMovie: DetailMovieViewModel, favorite: Bool) {
		if favorite {
			viewModel.saveFavorite(detailMovie: detailMovie)
		} else {
			viewModel.deleteFavorite(detailMovie: detailMovie)
		}
	}

}
