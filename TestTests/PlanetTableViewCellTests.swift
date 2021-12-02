//
//  PlanetTableViewCellTests.swift
//  TestTests
//
//  Created by Salma Khattab on 02/12/2021.
//

import XCTest
@testable import Test

class PlanetTableViewCellTests: XCTestCase {

    func testconfigureLabelText() throws {
        let cell = PlanetTableViewCell()
        let text = "Earth"
        cell.configureLabelText(text: text)
        XCTAssertNotNil(cell.label)
        XCTAssertEqual(cell.label.text, text)
    }

}
