//
//  GWTitleLabelTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 07.12.22.
//

import XCTest
import Foundation
@testable import GitHub_Watcher

final class GWTitleLabelTests: XCTestCase {

	func testDefaultInitialisation() {

		let titleLabel = GWTitleLabel()

		XCTAssertFalse(titleLabel.translatesAutoresizingMaskIntoConstraints)
		XCTAssertEqual(titleLabel.textColor, .label)
		XCTAssertEqual(titleLabel.lineBreakMode, .byTruncatingTail)
		XCTAssertTrue(titleLabel.adjustsFontSizeToFitWidth)
		XCTAssertGreaterThanOrEqual(titleLabel.minimumScaleFactor, 0.89)
	}

	func testInitialisationWithConvenienceInit() {
		let titleLabel = GWTitleLabel(textAlignment: .center, fontSize: 18)

		XCTAssertFalse(titleLabel.translatesAutoresizingMaskIntoConstraints)
		XCTAssertEqual(titleLabel.textColor, .label)
		XCTAssertEqual(titleLabel.lineBreakMode, .byTruncatingTail)
		XCTAssertTrue(titleLabel.adjustsFontSizeToFitWidth)
		XCTAssertGreaterThanOrEqual(titleLabel.minimumScaleFactor, 0.89)

		XCTAssertEqual(titleLabel.textAlignment, .center)
		XCTAssertEqual(titleLabel.font, UIFont.systemFont(ofSize: 18, weight: .bold))
	}
}
