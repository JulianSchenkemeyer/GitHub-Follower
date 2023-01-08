//
//  GWAvatarImageView.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 08.01.23.
//

import UIKit

class GWAvatarImageView: GWImageView {

	let placeholderImage = UIImage(systemName: "person.fill")

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configure() {
		layer.cornerRadius = 10
		clipsToBounds = true
		image = placeholderImage
		tintColor = .secondaryLabel
		translatesAutoresizingMaskIntoConstraints = false
	}
}
