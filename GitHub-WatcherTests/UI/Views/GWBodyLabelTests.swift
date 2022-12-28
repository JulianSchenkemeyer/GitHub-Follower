//
//  GWBodyLabelTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 27.12.22.
//

import XCTest
import Foundation
@testable import GitHub_Watcher

final class GWBodyLabelTests: XCTestCase {

	func testDefaultInitialisation() {

		let bodyLabel = GWBodyLabel()

		XCTAssertFalse(bodyLabel.translatesAutoresizingMaskIntoConstraints)
		XCTAssertEqual(bodyLabel.textColor, .secondaryLabel)
		XCTAssertEqual(bodyLabel.lineBreakMode, .byWordWrapping)
		XCTAssertTrue(bodyLabel.adjustsFontSizeToFitWidth)
		XCTAssertGreaterThanOrEqual(bodyLabel.minimumScaleFactor, 0.74)
		XCTAssertEqual(bodyLabel.numberOfLines, 5)
	}

	func testInitialisationWithConvenienceInit() {
		let bodyLabel = GWBodyLabel(textAlignment: .center)

		XCTAssertFalse(bodyLabel.translatesAutoresizingMaskIntoConstraints)
		XCTAssertEqual(bodyLabel.textColor, .secondaryLabel)
		XCTAssertEqual(bodyLabel.lineBreakMode, .byWordWrapping)
		XCTAssertTrue(bodyLabel.adjustsFontSizeToFitWidth)
		XCTAssertGreaterThanOrEqual(bodyLabel.minimumScaleFactor, 0.74)
		XCTAssertEqual(bodyLabel.numberOfLines, 5)

		XCTAssertEqual(bodyLabel.textAlignment, .center)
	}


}
