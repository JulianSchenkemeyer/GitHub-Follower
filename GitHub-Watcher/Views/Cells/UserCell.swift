//
//  UserCell.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 07.12.22.
//

import UIKit

class UserCell: UICollectionViewCell {

	static let reuseId = "UserCell"

	let avatarImage = GWAvatarImageView(frame: .zero)
	let nameLabel = GWTitleLabel(textAlignment: .left, fontSize: 16)

	override init(frame: CGRect) {
		super.init(frame: frame)

		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func set(name: String, imageUrl: String) {
		nameLabel.text = name
		avatarImage.downloadImage(from: imageUrl)
	}

	private func configure() {
		configureAvatarImageView()
		configureTitleLabel()
	}

	private func configureAvatarImageView() {
		addSubview(avatarImage)

		NSLayoutConstraint.activate([
			avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			avatarImage.heightAnchor.constraint(equalToConstant: 60),
			avatarImage.widthAnchor.constraint(equalToConstant: 60)
		])
	}

	private func configureTitleLabel() {
		addSubview(nameLabel)

		NSLayoutConstraint.activate([
			nameLabel.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			nameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}
}
