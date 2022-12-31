//
//  GWButton.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 03.12.22.
//

import UIKit

class GWButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init(color: UIColor, title: String) {
		self.init(frame: .zero)

		configure()
		set(color: color, title: title)
	}

	private func configure() {
		configuration = .tinted()
		configuration?.cornerStyle = .medium

		translatesAutoresizingMaskIntoConstraints = false
	}

	private func set(color: UIColor, title: String) {
		configuration?.baseBackgroundColor = color
		configuration?.baseForegroundColor = color
		configuration?.title = title
	}
}
