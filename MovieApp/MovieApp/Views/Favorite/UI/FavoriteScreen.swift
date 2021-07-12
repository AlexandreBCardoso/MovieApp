//
//  FavoriteScreen.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 07/07/21.
//

import UIKit

class FavoriteScreen: UIView {
	
	// MARK: - Element UI
	lazy var tableView: UITableView = {
		let table = UITableView(frame: .zero)
		table.rowHeight = 130
		table.backgroundColor = .white
		table.separatorStyle = .none
		table.translatesAutoresizingMaskIntoConstraints = false
		return table
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
	func tableViewDelegate(delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?) {
		self.tableView.delegate = delegate
		self.tableView.dataSource = dataSource
	}
	
}


// MARK: - Extension CodeView
extension FavoriteScreen: CodeView {
	
	func buildHierarchy() {
		addSubview(tableView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
