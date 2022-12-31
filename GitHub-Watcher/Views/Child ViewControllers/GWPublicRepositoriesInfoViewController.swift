//
//  GWPublicRepositoriesInfoViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 31.12.22.
//

import UIKit

class GWPublicRepositoriesInfoViewController: UIViewController {

	let repositorySymbol = UIImageView()
	let titleLabel = GWTitleLabel(textAlignment: .left, fontSize: 18)
	let repositoriesCount = GWTitleLabel(textAlignment: .center, fontSize: 38)
	let showReporsitoriesButton = GWButton(color: .systemCyan, title: "Show Public Repositories")

	let padding: CGFloat = 15

    override func viewDidLoad() {
        super.viewDidLoad()

		configure()
    }
    
	private func configure() {
		configureBackground()
		configureRepositorySymbol()
		configureTitleLabel()
		configureRepositoriesCount()
		configureShowReporsitoriesButton()
	}

	private func configureBackground() {
		view.layer.cornerRadius = 18
		view.backgroundColor = .secondarySystemBackground
	}

	private func configureRepositorySymbol() {
		view.addSubview(repositorySymbol)

		repositorySymbol.image = UIImage(systemName: "folder")
		repositorySymbol.tintColor = .label

		repositorySymbol.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			repositorySymbol.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
			repositorySymbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			repositorySymbol.heightAnchor.constraint(equalToConstant: 20),
			repositorySymbol.widthAnchor.constraint(equalToConstant: 20)
		])
	}

	private func configureTitleLabel() {
		view.addSubview(titleLabel)

		titleLabel.text = "Public Repositories"

		NSLayoutConstraint.activate([
			titleLabel.centerYAnchor.constraint(equalTo: repositorySymbol.centerYAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: repositorySymbol.trailingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			titleLabel.heightAnchor.constraint(equalToConstant: 25)
		])
	}

	private func configureRepositoriesCount() {
		view.addSubview(repositoriesCount)

		repositoriesCount.text = "14"

		NSLayoutConstraint.activate([
			repositoriesCount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			repositoriesCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			repositoriesCount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			repositoriesCount.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	private func configureShowReporsitoriesButton() {
		view.addSubview(showReporsitoriesButton)

		NSLayoutConstraint.activate([
			showReporsitoriesButton.topAnchor.constraint(equalTo: repositoriesCount.bottomAnchor, constant: 10),
			showReporsitoriesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			showReporsitoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			showReporsitoriesButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
}
