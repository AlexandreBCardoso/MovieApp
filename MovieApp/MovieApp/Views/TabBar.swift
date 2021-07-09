//
//  TabBar.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 29/06/21.
//

import UIKit

class TabBar: UITabBarController {
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTabBar()
		setupViewControllers()
	}
	
	
	// MARK: - Function
	private func setupTabBar() {
		UITabBar.appearance().barTintColor = .systemYellow
		tabBar.tintColor = UIColor.black
	}
	
	private func setupViewControllers() {
		guard let imageFavorite = UIImage(named: "favorite_empty_icon"),
				let imageMovies = UIImage(named: "list_icon") else { return  }
		
		viewControllers = [
			createNavController(for: MoviesViewController(),
									  title: "Movies",
									  image: imageMovies),
			
			createNavController(for: FavoritesViewController(),
									  title: "Favorites",
									  image: imageFavorite),
		]
	}
	
	private func createNavController(for rootViewController: UIViewController, title: String,
													 image: UIImage) -> UIViewController {
		
		let navController = UINavigationController(rootViewController: rootViewController)
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		navController.navigationBar.tintColor = UIColor(named: "backColor")
		navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "backColor") ?? UIColor.black]
		rootViewController.navigationItem.title = title
		return navController
	}
	
}
