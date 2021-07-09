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
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var errorImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(named: "error")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.numberOfLines = 0
		label.text = "Nenhum filme favoritado!"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
	
}


// MARK: - Extension CodeView
extension NotFoundCell: CodeView {
	
	func buildHierarchy() {
		contentView.addSubview(viewScreen)
		viewScreen.addSubview(errorImageView)
		viewScreen.addSubview(titleLabel)
	}
	
	func setupConstraints() {
		viewScreen.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		viewScreen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		viewScreen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		viewScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		
		errorImageView.topAnchor.constraint(equalTo: viewScreen.topAnchor, constant: 30).isActive = true
		errorImageView.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor).isActive = true
		errorImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		errorImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 20).isActive = true
		titleLabel.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: viewScreen.leadingAnchor, constant: 30).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: viewScreen.trailingAnchor, constant: -30).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
	
}

