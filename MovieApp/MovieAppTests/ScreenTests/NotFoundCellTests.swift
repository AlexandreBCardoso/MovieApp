//
//  NotFoundCellTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 11/07/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MovieApp

class NotFoundCellTests: QuickSpec {
	
	override func spec() {
		describe("The UI") {
			
			it("Cell without favorite") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
				let view = NotFoundCell(style: .default, reuseIdentifier: nil)
				view.frame = frame
				
				expect(view) == snapshot("NotFoundCell")
			}
			
		}
	}
	
}
