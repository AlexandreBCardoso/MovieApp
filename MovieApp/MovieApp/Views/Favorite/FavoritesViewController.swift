//
//  FavoritesViewController.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 29/06/21.
//

import UIKit

final class FavoritesViewController: UIViewController {
	
	// MARK: - Variable
	private let favoriteScreen = FavoriteScreen()
	private let viewModel = FavoriteViewModel()
	
	
	// MARK: - Life cycle
	override func loadView() {
		self.view = favoriteScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupFavoriteScrenn()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel.fetchServiceLocal()
		favoriteScreen.tableView.reloadData()
	}
	
	
	// MARK: - Function
	private func setupFavoriteScrenn() {
		self.favoriteScreen.tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
		self.favoriteScreen.tableView.register(NotFoundCell.self, forCellReuseIdentifier: NotFoundCell.identifier)
		self.favoriteScreen.tableViewDelegate(delegate: self, dataSource: self)
	}
	
}


// MARK: - Extension TableView
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfFavorites
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if viewModel.checkIsEmpty() {
			let cell = tableView.dequeueReusableCell(withIdentifier: NotFoundCell.identifier, for: indexPath) as? NotFoundCell
			return cell ?? UITableViewCell()
		} else {
			let favorite = viewModel.getFavorite(indexPath: indexPath)
			let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as? FavoriteCell
			cell?.setupCell(viewModel: favorite)
			return cell ?? UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if viewModel.checkIsEmpty() {
			return 300
		} else {
			return 130
		}
	}
		
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		
		let deleteAction = UIContextualAction(style: .destructive, title: "Unfavorite") { (_, _, completion) in
			let favorite = self.viewModel.getFavorite(indexPath: indexPath)
			self.viewModel.deleteFavorite(favorite: favorite)
			self.viewModel.fetchServiceLocal()
			self.favoriteScreen.tableView.reloadData()
			completion(true)
		}
		let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
		
		return configuration
	}
	
}
