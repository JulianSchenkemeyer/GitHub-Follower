//
//  GWImageView.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 08.01.23.
//

import XCTest
import Foundation
@testable import GitHub_Watcher

final class GWImageView: XCTestCase {

	func testDefaultInitialisation() {
		let imageView = GWImageView()

		XCTAssert(imageView.image)
	}
}
