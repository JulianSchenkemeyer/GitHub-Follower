//
//  GWButtonTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 03.12.22.
//

import XCTest
@testable import GitHub_Watcher

final class GWButtonTests: XCTestCase {

	func testButtonConfiguration() {
		let gwButton = GWButton(color: .blue, title: "custom button")

		XCTAssertEqual(gwButton.translatesAutoresizingMaskIntoConstraints, false)
		XCTAssertEqual(gwButton.titleLabel?.text, "custom button")
		XCTAssertEqual(gwButton.configuration?.cornerStyle, .medium)
		XCTAssertEqual(gwButton.configuration?.baseBackgroundColor, .blue)
		XCTAssertEqual(gwButton.configuration?.baseForegroundColor, .blue)
	}
}
