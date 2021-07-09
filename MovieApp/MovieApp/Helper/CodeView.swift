//
//  CodeView.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 30/06/21.
//

import Foundation

protocol CodeView {
	func buildHierarchy()
	func setupConstraints()
	func setupAdditionalConfiguration()
	func setupView()
}

extension CodeView {
	
	func setupView() {
		buildHierarchy()
		setupConstraints()
		setupAdditionalConfiguration()
	}
	
}
