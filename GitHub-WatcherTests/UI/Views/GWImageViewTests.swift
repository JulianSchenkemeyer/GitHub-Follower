//
//  GWImageView.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 08.01.23.
//

import XCTest
import Foundation
@testable import GitHub_Watcher

final class GWImageViewTests: XCTestCase {

	func testDefaultInitialisation() {
		let imageView = GWImageView(frame: .zero)

		XCTAssertEqual(imageView.imageCache, Cache.shared.images)
	}

	//TODO: Test download method
}
