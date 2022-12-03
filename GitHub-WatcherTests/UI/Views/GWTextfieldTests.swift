//
//  GWTextfieldTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 03.12.22.
//

import XCTest
@testable import GitHub_Watcher

final class GWTextfieldTests: XCTestCase {

	func testTextfieldConfiguration() {
		let textfield = GWTextfield()

		XCTAssertEqual(textfield.translatesAutoresizingMaskIntoConstraints, false)
		XCTAssertEqual(textfield.layer.cornerRadius, 10)
		XCTAssertEqual(textfield.layer.borderWidth, 2)
		XCTAssertEqual(textfield.layer.borderColor, UIColor.systemGray.cgColor)
		XCTAssertEqual(textfield.textColor, .label)
		XCTAssertEqual(textfield.tintColor, .label)
		XCTAssertEqual(textfield.textAlignment, .center)
		XCTAssertEqual(textfield.font, .preferredFont(forTextStyle: .title2))
		XCTAssertEqual(textfield.adjustsFontSizeToFitWidth, true)
		XCTAssertEqual(textfield.minimumFontSize, 12)
		XCTAssertEqual(textfield.autocorrectionType, .no)
		XCTAssertEqual(textfield.backgroundColor, .tertiarySystemBackground)

		XCTAssertNil(textfield.placeholder)
	}

	func testTextfieldConfigurationWithPlaceholder() {
		let textfield = GWTextfield(placeholder: "custom textfield")

		XCTAssertEqual(textfield.translatesAutoresizingMaskIntoConstraints, false)
		XCTAssertEqual(textfield.layer.cornerRadius, 10)
		XCTAssertEqual(textfield.layer.borderWidth, 2)
		XCTAssertEqual(textfield.layer.borderColor, UIColor.systemGray.cgColor)
		XCTAssertEqual(textfield.textColor, .label)
		XCTAssertEqual(textfield.tintColor, .label)
		XCTAssertEqual(textfield.textAlignment, .center)
		XCTAssertEqual(textfield.font, .preferredFont(forTextStyle: .title2))
		XCTAssertEqual(textfield.adjustsFontSizeToFitWidth, true)
		XCTAssertEqual(textfield.minimumFontSize, 12)
		XCTAssertEqual(textfield.autocorrectionType, .no)
		XCTAssertEqual(textfield.backgroundColor, .tertiarySystemBackground)

		XCTAssertEqual(textfield.placeholder, "custom textfield")
	}
}
