//
//  FavoriteCell.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 07/07/21.
//

import UIKit

final class FavoriteCell: UITableViewCell {
	
	// MARK: - Variable
	static let identifier: String = "FavoriteCell"
	
	// MARK: - Element UI
	lazy var viewCell: UIView = {
		let view = UIView.usingAutoLayout()
		view.backgroundColor = .systemGray
		return view
	}()
	
	lazy var movieImageView: CustomImageView = {
		let imageView = CustomImageView.usingAutoLayout()
		imageView.backgroundColor = .gray
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		label.textColor = UIColor(named: "backColor")
		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	lazy var yearLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
		label.textColor = UIColor(named: "backColor")
		return label
	}()
	
	lazy var summaryLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 15, weight: .light)
		label.textColor = UIColor(named: "backColor")
		return label
	}()
	
	
	// MARK: - Initialize
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		movieImageView.image = nil
	}
	
	
	// MARK: - Function
	func setupCell(viewModel: FavoriteModel) {
		if let url = URL(string: viewModel.pathImage) {
			movieImageView.loadImage(from: url)
		}
		titleLabel.text = viewModel.original_title
		yearLabel.text = viewModel.year_release
		summaryLabel.text = viewModel.overview
	}
	
}


// MARK: - Extension CodeView
extension FavoriteCell: CodeView {
	
	func buildHierarchy() {
		contentView.addSubview(viewCell)
		viewCell.addSubview(movieImageView)
		viewCell.addSubview(titleLabel)
		viewCell.addSubview(yearLabel)
		viewCell.addSubview(summaryLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
			viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
			
			movieImageView.topAnchor.constraint(equalTo: viewCell.topAnchor),
			movieImageView.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor),
			movieImageView.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor),
			movieImageView.widthAnchor.constraint(equalTo: viewCell.widthAnchor, multiplier: 0.35),
			
			titleLabel.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10),
			titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: yearLabel.leadingAnchor, constant: -10),
			titleLabel.heightAnchor.constraint(equalToConstant: 20),
			
			yearLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
			yearLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -15),
			yearLabel.heightAnchor.constraint(equalToConstant: 20),
			yearLabel.widthAnchor.constraint(equalToConstant: 40),
			
			summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			summaryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			summaryLabel.trailingAnchor.constraint(equalTo: yearLabel.trailingAnchor),
			summaryLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -7)
		])
	}
	
	func setupAdditionalConfiguration() {
		contentView.backgroundColor = .white
	}
	
}
