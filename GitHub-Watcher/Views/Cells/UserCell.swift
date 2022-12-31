//
//  UserCell.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 07.12.22.
//

import UIKit

class UserCell: UICollectionViewCell {

	static let reuseId = "UserCell"

//	let avatarImage = UIImageView()
	let nameLabel = GWTitleLabel(textAlignment: .left, fontSize: 16)

	override init(frame: CGRect) {
		super.init(frame: frame)

		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func set(name: String) {
		nameLabel.text = name
	}

	private func configure() {
		configureTitleLabel()
	}

	private func configureTitleLabel() {
		addSubview(nameLabel)

		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			nameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}
}
