//
//  Extension+UIView.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 12/07/21.
//

import UIKit

extension UIView {
	
	static func usingAutoLayout() -> Self {
		let view = self.init(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}
	
}
