//
//  CodeViewTests.swift
//  MovieAppTests
//
//  Created by Alexandre Cardoso on 13/07/21.
//

import XCTest

class CodeViewTests: XCTestCase {
	
	override func setUpWithError() throws {
	}
	
	override func tearDownWithError() throws {
	}
	
	func testExample() throws {
	}
	
	func test_ordem_metodos() {
		let view = ViewMock()
		let expectedMethod = ["buildHierarchy", "setupConstraints", "setupAdditionalConfiguration"]
		
		XCTAssertEqual(view.callMethod.count, expectedMethod.count)
		XCTAssertTrue(view.callMethod[0] == expectedMethod[0])
		XCTAssertTrue(view.callMethod[1] == expectedMethod[1])
		XCTAssertTrue(view.callMethod[2] == expectedMethod[2])
	}
	
}
