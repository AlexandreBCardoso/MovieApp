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
		let view = UIView(frame: .zero)
		view.backgroundColor = .systemGray
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var movieImageView: CustomImageView = {
		let imageView = CustomImageView(frame: .zero)
		imageView.backgroundColor = .gray
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		label.textColor = UIColor(named: "backColor")
		label.adjustsFontSizeToFitWidth = true
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var yearLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
		label.textColor = UIColor(named: "backColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var summaryLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 15, weight: .light)
		label.textColor = UIColor(named: "backColor")
		label.translatesAutoresizingMaskIntoConstraints = false
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
		viewCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
		
		movieImageView.topAnchor.constraint(equalTo: viewCell.topAnchor).isActive = true
		movieImageView.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor).isActive = true
		movieImageView.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor).isActive = true
		movieImageView.widthAnchor.constraint(equalTo: viewCell.widthAnchor, multiplier: 0.35).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: yearLabel.leadingAnchor, constant: -10).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
		
		yearLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
		yearLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -15).isActive = true
		yearLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
		yearLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
		
		summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
		summaryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		summaryLabel.trailingAnchor.constraint(equalTo: yearLabel.trailingAnchor).isActive = true
		summaryLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -7).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		contentView.backgroundColor = .white
	}
	
}
