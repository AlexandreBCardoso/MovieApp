//
//  DetailMovieScreen.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 04/07/21.
//

import UIKit

protocol DetailMovieScreenDelegate: AnyObject {
	func updateFavorite(favorite: Bool)
}

final class DetailMovieScreen: UIView {
	
	// MARK: - Element UI
	lazy var movieImageView: CustomImageView = {
		let imageView = CustomImageView.usingAutoLayout()
		imageView.backgroundColor = .gray
		imageView.contentMode = .scaleToFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		return label
	}()
	
	lazy var favoriteButtom: UIButton = {
		let button = UIButton.usingAutoLayout()
		button.addTarget(self, action: #selector(changeFavorite(_:)), for: .touchUpInside)
		button.contentHorizontalAlignment = .fill
		button.contentVerticalAlignment = .fill
		return button
	}()
	
	lazy var yearLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		return label
	}()
	
	lazy var genreLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		return label
	}()
	
	lazy var summaryLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		return label
	}()
	
	private var favorite: Bool = false
	
	weak var delegate: DetailMovieScreenDelegate?
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	@objc func changeFavorite(_ sender: UIButton) {
		let iconFavorite: String = !favorite ? IconName.favorite : IconName.unfavorite
		self.favoriteButtom.setImage(UIImage(named: iconFavorite), for: .normal)
		self.favorite = !favorite
		self.delegate?.updateFavorite(favorite: favorite)
	}
	
	func setupFavoriteButton(_ icon: String) {
		favoriteButtom.setImage(UIImage(named: icon), for: .normal)
	}
	
	func setupFavoriteIcon(_ icon: Bool) {
		self.favorite = icon
	}
	
}


// MARK: - Extension CodeView
extension DetailMovieScreen: CodeView {
	
	func buildHierarchy() {
		addSubview(movieImageView)
		addSubview(titleLabel)
		addSubview(favoriteButtom)
		addSubview(yearLabel)
		addSubview(genreLabel)
		addSubview(summaryLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			movieImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			movieImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
			
			favoriteButtom.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 10),
			favoriteButtom.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
			favoriteButtom.heightAnchor.constraint(equalToConstant: 30),
			favoriteButtom.widthAnchor.constraint(equalToConstant: 30),
			
			titleLabel.topAnchor.constraint(equalTo: favoriteButtom.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: favoriteButtom.leadingAnchor, constant: -10),
			titleLabel.bottomAnchor.constraint(equalTo: favoriteButtom.bottomAnchor),
			
			yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
			yearLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
			yearLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
			yearLabel.heightAnchor.constraint(equalToConstant: 30),
			
			genreLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
			genreLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
			genreLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
			genreLabel.heightAnchor.constraint(equalToConstant: 30),
			
			summaryLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5),
			summaryLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
			summaryLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
			summaryLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
		])
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
