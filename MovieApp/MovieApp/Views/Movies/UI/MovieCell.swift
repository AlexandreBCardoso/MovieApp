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
		let view = UIView(frame: .zero)
		view.backgroundColor = UIColor(named: "backColor")
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
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
		label.numberOfLines = 1
		label.textColor = UIColor(named: "secondColor")
		label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		label.textAlignment = .center
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.7
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var favoriteImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
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
		viewCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		
		movieImageView.topAnchor.constraint(equalTo: viewCell.topAnchor).isActive = true
		movieImageView.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor).isActive = true
		movieImageView.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor).isActive = true
		movieImageView.heightAnchor.constraint(equalTo: viewCell.heightAnchor, multiplier: 0.8).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 5).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 5).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: favoriteImageView.leadingAnchor, constant: -10).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -5).isActive = true
		
		favoriteImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
		favoriteImageView.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -10).isActive = true
		favoriteImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
		favoriteImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
