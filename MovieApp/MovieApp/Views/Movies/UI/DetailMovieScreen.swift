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
		let imageView = CustomImageView(frame: .zero)
		imageView.backgroundColor = .gray
		imageView.contentMode = .scaleToFill
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var favoriteButtom: UIButton = {
		let button = UIButton(frame: .zero)
		button.addTarget(self, action: #selector(changeFavorite(_:)), for: .touchUpInside)
		button.contentHorizontalAlignment = .fill
		button.contentVerticalAlignment = .fill
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var yearLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var genreLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var summaryLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		label.translatesAutoresizingMaskIntoConstraints = false
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
		let iconFavorite: String = !favorite ? "favorite_full_icon" : "favorite_gray_icon"
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
		movieImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
		movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
		movieImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
		
		favoriteButtom.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 10).isActive = true
		favoriteButtom.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
		favoriteButtom.heightAnchor.constraint(equalToConstant: 30).isActive = true
		favoriteButtom.widthAnchor.constraint(equalToConstant: 30).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: favoriteButtom.topAnchor).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: favoriteButtom.leadingAnchor, constant: -10).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: favoriteButtom.bottomAnchor).isActive = true
		
		yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
		yearLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
		yearLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
		yearLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		genreLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5).isActive = true
		genreLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
		genreLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
		genreLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		summaryLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5).isActive = true
		summaryLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
		summaryLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
		summaryLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
