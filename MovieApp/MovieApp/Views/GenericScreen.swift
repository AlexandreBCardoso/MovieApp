//
//  GenericScreen.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 09/07/21.
//

import UIKit

class GenericScreen: UIView {
	
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
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


// MARK: - Extension CodeView
extension GenericScreen: CodeView {
	
	func buildHierarchy() {
		addSubview(viewScreen)
		viewScreen.addSubview(errorImageView)
		viewScreen.addSubview(titleLabel)
	}
	
	func setupConstraints() {
		viewScreen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		viewScreen.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		viewScreen.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
		viewScreen.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		
		errorImageView.topAnchor.constraint(equalTo: viewScreen.topAnchor, constant: 30).isActive = true
		errorImageView.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor).isActive = true
		errorImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
		errorImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 20).isActive = true
		titleLabel.centerXAnchor.constraint(equalTo: viewScreen.centerXAnchor).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: viewScreen.leadingAnchor, constant: 30).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: viewScreen.trailingAnchor, constant: -30).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: viewScreen.bottomAnchor, constant: -50).isActive = true
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
	
}
