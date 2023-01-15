//
//  GWUserHeaderViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.12.22.
//

import UIKit

class GWUserHeaderViewController: UIViewController {

	let imageView = GWAvatarImageView(frame: .zero)
	let usernameLabelView = GWTitleLabel(textAlignment: .left, fontSize: 18)
	let userFullnameLabelView = GWTitleLabel(textAlignment: .left, fontSize: 16)
	let bioLabelView = GWBodyLabel(textAlignment: .left)

	var user: User!


	init(user: User) {
		super.init(nibName: nil, bundle: nil)
		self.user = user
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		configure()
	}

	private func configure() {
		view.layer.cornerRadius = 18
		view.backgroundColor = .secondarySystemBackground

		configureImageView()
		configureUsernameLabelView()
		configureUserFullnameLabelView()
		configureBioLabelView()
	}

	private func configureImageView() {
		view.addSubview(imageView)

		imageView.downloadImage(from: user.avatarUrl)
		imageView.layer.cornerRadius = 18

		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			imageView.heightAnchor.constraint(equalToConstant: 80),
			imageView.widthAnchor.constraint(equalToConstant: 80)
		])
	}

	private func configureUsernameLabelView() {
		view.addSubview(usernameLabelView)
		usernameLabelView.text = user.login

		NSLayoutConstraint.activate([
			usernameLabelView.topAnchor.constraint(equalTo: imageView.topAnchor),
			usernameLabelView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
			usernameLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			usernameLabelView.heightAnchor.constraint(equalToConstant: 25)
		])
	}

	private func configureUserFullnameLabelView() {
		view.addSubview(userFullnameLabelView)
		userFullnameLabelView.text = user.name
		usernameLabelView.textColor = .secondaryLabel

		NSLayoutConstraint.activate([
			userFullnameLabelView.topAnchor.constraint(equalTo: usernameLabelView.bottomAnchor, constant: 10),
			userFullnameLabelView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
			userFullnameLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			userFullnameLabelView.heightAnchor.constraint(equalToConstant: 20)
		])
	}

	private func configureBioLabelView() {
		view.addSubview(bioLabelView)

		bioLabelView.text = user.bio

		bioLabelView.numberOfLines = 4
		bioLabelView.lineBreakMode = .byTruncatingTail
		
		NSLayoutConstraint.activate([
			bioLabelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
			bioLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			bioLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//			bioLabelView.heightAnchor.constraint(equalToConstant: 150)
			bioLabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
		])
	}
}
