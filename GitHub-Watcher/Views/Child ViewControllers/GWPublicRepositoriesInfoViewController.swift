//
//  GWPublicRepositoriesInfoViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 31.12.22.
//

import UIKit

protocol GWPublicRepositoriesInfoDelegate: AnyObject {
	func didTaShowPublicRepositories()
}

class GWPublicRepositoriesInfoViewController: UIViewController {

	weak var delegate: GWPublicRepositoriesInfoDelegate!

	let repositorySymbol = UIImageView()
	let titleLabel = GWTitleLabel(textAlignment: .left, fontSize: 18)
	let repositoriesCountLabel = GWTitleLabel(textAlignment: .center, fontSize: 38)
	let showReporsitoriesButton = GWButton(color: .systemCyan, title: "Show Public Repositories")

	let padding: CGFloat = 15

	var repositoriesCount = 0

	init(repositories: Int, delegate: GWPublicRepositoriesInfoDelegate) {
		super.init(nibName: nil, bundle: nil)
		self.repositoriesCount = repositories
		self.delegate = delegate
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

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
		view.addSubview(repositoriesCountLabel)

		repositoriesCountLabel.text = "\(repositoriesCount)"

		NSLayoutConstraint.activate([
			repositoriesCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			repositoriesCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			repositoriesCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			repositoriesCountLabel.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	private func configureShowReporsitoriesButton() {
		view.addSubview(showReporsitoriesButton)

		showReporsitoriesButton.addTarget(self, action: #selector(showRepositoriesButtonTapped), for: .touchUpInside)

		NSLayoutConstraint.activate([
			showReporsitoriesButton.topAnchor.constraint(equalTo: repositoriesCountLabel.bottomAnchor, constant: 10),
			showReporsitoriesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			showReporsitoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			showReporsitoriesButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc private func showRepositoriesButtonTapped() {
		delegate.didTaShowPublicRepositories()
	}
}
