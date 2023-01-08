//
//  File.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 08.01.23.
//

import XCTest
import Foundation
@testable import GitHub_Watcher

final class GWAvatarImageViewTests: XCTestCase {

	func testDefaultInitialisation() {
		let imageView = GWAvatarImageView(frame: .zero)

		let expectedPlaceholder = UIImage(systemName: "person.fill")

		XCTAssertEqual(imageView.imageCache, Cache.shared.images)
		XCTAssertEqual(imageView.layer.cornerRadius, 10)
		XCTAssertTrue(imageView.clipsToBounds)
		XCTAssertEqual(imageView.image, expectedPlaceholder)
		XCTAssertEqual(imageView.tintColor, .secondaryLabel)
		XCTAssertFalse(imageView.translatesAutoresizingMaskIntoConstraints)
	}

	//TODO: Test download method

	//TODO: Test Fallback to placeholder
}
