//
//  GWTextfield.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 03.12.22.
//

import UIKit

class GWTextfield: UITextField {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init(placeholder: String) {
		self.init(frame: .zero)
		set(placeholder: placeholder)
	}

	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false

		layer.cornerRadius = 10
		layer.borderWidth = 2
		layer.borderColor = UIColor.systemGray.cgColor

		textColor = .label
		tintColor = .label
		textAlignment = .center
		font = .preferredFont(forTextStyle: .title2)
		adjustsFontSizeToFitWidth = true
		minimumFontSize = 12
		autocorrectionType = .no

		backgroundColor = .tertiarySystemBackground
	}

	private func set(placeholder: String) {
		self.placeholder = placeholder
	}
}
