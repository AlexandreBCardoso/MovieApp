//
//  NotFoundCell.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 09/07/21.
//

import UIKit

class NotFoundCell: UITableViewCell {
	
	// MARK: - Variable
	static let identifier = "NotFoundCell"
	
	// MARK: - Element UI
	lazy var viewScreen: UIView = {
		let view = UIView.usingAutoLayout()
		return view
	}()
	
	lazy var errorImageView: UIImageView = {
		let imageView = UIImageView.usingAutoLayout()
		imageView.image = UIImage(named: "error")
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.usingAutoLayout()
		label.numberOfLines = 0
		label.text = "Nenhum filme favoritado!"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
	
}


// MARK: - Extension CodeView
extension NotFoundCell: CodeView {
	
	func buildHierarchy() {
		contentView.addSubview(viewScreen)
		viewScreen.addSubview(errorImageView)
		viewScreen.addSubview(titleLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			viewScreen.topAnchor.constraint(equalTo: contentView.topAnchor),
			viewScreen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			viewScreen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			viewScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			
			errorImageView.topAnchor.constraint(equalTo: viewScreen.topAnchor, constant: 30),
			errorImageView.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor),
			errorImageView.heightAnchor.constraint(equalToConstant: 100),
			errorImageView.widthAnchor.constraint(equalToConstant: 100),
			
			titleLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 20),
			titleLabel.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: viewScreen.leadingAnchor, constant: 30),
			titleLabel.trailingAnchor.constraint(equalTo: viewScreen.trailingAnchor, constant: -30),
			titleLabel.heightAnchor.constraint(equalToConstant: 25)
		])
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
	
}

