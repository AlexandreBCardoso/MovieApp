//
//  CardMovieScreen.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 30/06/21.
//

import UIKit

final class CardMovieScreen: UIView {
	
	// MARK: - Elements UI
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.sectionInset = UIEdgeInsets(top: 10.0, left: 7.0, bottom: 5.0, right: 7.0)

		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
		collection.backgroundColor = .white
		collection.showsVerticalScrollIndicator = false
		collection.translatesAutoresizingMaskIntoConstraints = false
		return collection
	}()
	
	lazy var spinner: UIActivityIndicatorView = {
		let spinner = UIActivityIndicatorView()
		spinner.style = .large
		spinner.backgroundColor = .systemGray
		spinner.translatesAutoresizingMaskIntoConstraints = false
		return spinner
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		setupView()
	}
		
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	func delegate(delegate: UICollectionViewDelegate) {
		collectionView.delegate = delegate
	}
	
	func dataSource(dataSource: UICollectionViewDataSource) {
		collectionView.dataSource = dataSource
	}
		
}


// MARK: - Extension CodeView
extension CardMovieScreen: CodeView {
	
	func buildHierarchy() {
		addSubview(collectionView)
		addSubview(spinner)
	}
	
	func setupConstraints() {
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		
		spinner.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		spinner.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		spinner.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
		spinner.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
