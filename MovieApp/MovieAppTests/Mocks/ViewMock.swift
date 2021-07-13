//
//  ViewMock.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

@testable import MovieApp
import UIKit


class ViewMock: UIView {
	
	var callMethod = [String]()

	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


extension ViewMock: CodeView {
	
	func buildHierarchy() {
		self.callMethod.append("buildHierarchy")
	}
	
	func setupConstraints() {
		self.callMethod.append("setupConstraints")
	}
	
	func setupAdditionalConfiguration() {
		self.callMethod.append("setupAdditionalConfiguration")
	}

}
