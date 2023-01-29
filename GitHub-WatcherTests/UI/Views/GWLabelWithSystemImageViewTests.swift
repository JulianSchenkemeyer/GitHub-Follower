//
//  GWLabelWithSystemImageViewTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 29.01.23.
//

import XCTest
import UIKit
@testable import GitHub_Watcher

final class GWLabelWithSystemImageViewTests: XCTestCase {

	func testDefaultInitialisation() throws {
		let labelWithSystemImage = GWLabelWithSystemImageView()

		XCTAssertNil(labelWithSystemImage.systemImageView.image)
		let unwrappedLabelText = try XCTUnwrap(labelWithSystemImage.labelView.text)
		XCTAssertEqual(unwrappedLabelText, "")
	}

	func testConvenienceInitSymbolOnly() throws {
		let labelWithSystemImage = GWLabelWithSystemImageView(symbol: .issues)
		let expectedImage = UIImage(systemName: "square.and.pencil")

		XCTAssertEqual(labelWithSystemImage.systemImageView.image, expectedImage)
		let unwrappedLabelText = try XCTUnwrap(labelWithSystemImage.labelView.text)
		XCTAssertEqual(unwrappedLabelText, "")
	}

	func testConvenienceInitSymbolAndTitle() throws {
		let labelWithSystemImage = GWLabelWithSystemImageView(symbol: .fork, title: "Forks")
		let expectedImage = UIImage(systemName: "tuningfork")

		XCTAssertEqual(labelWithSystemImage.systemImageView.image, expectedImage)
		let unwrappedLabelText = try XCTUnwrap(labelWithSystemImage.labelView.text)
		XCTAssertEqual(unwrappedLabelText, "Forks")
	}

	func testUpdateTitleAfterInit() throws {
		let labelWithSystemImage = GWLabelWithSystemImageView()

		labelWithSystemImage.set(title: "new title")
		XCTAssertEqual(labelWithSystemImage.labelView.text, "new title")
	}
}
