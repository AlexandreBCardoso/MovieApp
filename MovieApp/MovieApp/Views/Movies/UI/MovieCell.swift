//
//  MovieCell.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 30/06/21.
//

import UIKit

final class MovieCell: UICollectionViewCell {
	
	// MARK: - Variable
	static let identifier: String = "MovieCell"
	
	// MARK: - Element UI
	lazy var viewCell: UIView = {
		let view = UIView.usingAutoLayout()
		view.backgroundColor = UIColor(named: "backColor")
		return view
	}()
	
	lazy var movieImageView: CustomImageView = {
		let imageView = CustomImageView.usingAutoLayout()
		imageView.backgroundColor = .gray
		imageView.contentMode = .scaleToFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.numberOfLines = 1
		label.textColor = UIColor(named: "secondColor")
		label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		label.textAlignment = .center
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.7
		return label
	}()
	
	lazy var favoriteImageView: UIImageView = {
		let imageView = UIImageView.usingAutoLayout()
		return imageView
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
	override func prepareForReuse() {
		super.prepareForReuse()
		self.favoriteImageView.image = nil
	}
	
	func setupCell(viewModel: MovieCellViewModel) {
		if let url = URL(string: viewModel.pathImage) {
			self.movieImageView.loadImage(from: url)
		}
		self.titleLabel.text = viewModel.original_title
		self.favoriteImageView.image = UIImage(named: viewModel.iconFavorite)
	}
	
}


// MARK: - Extension CodeView
extension MovieCell: CodeView {
	
	func buildHierarchy() {
		contentView.addSubview(viewCell)
		viewCell.addSubview(movieImageView)
		viewCell.addSubview(titleLabel)
		viewCell.addSubview(favoriteImageView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
			viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			
			movieImageView.topAnchor.constraint(equalTo: viewCell.topAnchor),
			movieImageView.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor),
			movieImageView.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor),
			movieImageView.heightAnchor.constraint(equalTo: viewCell.heightAnchor, multiplier: 0.8),
			
			titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 5),
			titleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 5),
			titleLabel.trailingAnchor.constraint(equalTo: favoriteImageView.leadingAnchor, constant: -10),
			titleLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -5),
			
			favoriteImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			favoriteImageView.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -10),
			favoriteImageView.heightAnchor.constraint(equalToConstant: 17),
			favoriteImageView.widthAnchor.constraint(equalToConstant: 17)
		])
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
