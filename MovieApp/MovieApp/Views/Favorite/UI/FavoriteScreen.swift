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
		tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
 	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
	}
	
}
