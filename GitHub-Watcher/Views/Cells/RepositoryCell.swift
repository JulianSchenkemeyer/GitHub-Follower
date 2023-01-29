//
//  RepositoryCellCollectionViewCell.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 17.01.23.
//

import UIKit

class RepositoryCell: UICollectionViewCell {

	static let reuseId = "RepositoryCell"

	let nameLabel = GWTitleLabel(textAlignment: .left, fontSize: 16)
	let ownerLabel = GWBodyLabel()

	let footerHStack = UIStackView()
	let forkView = GWLabelWithSystemImageView(symbol: .fork, title: "100")
	let watcherView = GWLabelWithSystemImageView(symbol: .watcher, title: "10000")
	let issuesView = GWLabelWithSystemImageView(symbol: .issues, title: "500")
	let languageLabel = GWTitleLabel(textAlignment: .center, fontSize: 14)

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
		configureBackground()
		configureTitleLabel()
		configureOwnerLabel()
		configureFooterHStack()
		configureLanguageLabel()
	}

	private func configureBackground() {
		contentView.backgroundColor = .secondarySystemBackground
		contentView.layer.cornerRadius = 10
	}

	private func configureTitleLabel() {
		contentView.addSubview(nameLabel)

		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			nameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}

	private func configureOwnerLabel() {
		contentView.addSubview(ownerLabel)
		ownerLabel.text = "Max Muster"

		NSLayoutConstraint.activate([
			ownerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
			ownerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			ownerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			ownerLabel.heightAnchor.constraint(equalToConstant: 30)
		])
	}

	private func configureFooterHStack() {
		contentView.addSubview(footerHStack)

		footerHStack.translatesAutoresizingMaskIntoConstraints = false
		footerHStack.axis = .horizontal
		footerHStack.distribution = .equalSpacing

		NSLayoutConstraint.activate([
			footerHStack.topAnchor.constraint(equalTo: ownerLabel.bottomAnchor, constant: 18),
			footerHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			footerHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			footerHStack.heightAnchor.constraint(equalToConstant: 20)
		])

		footerHStack.addArrangedSubview(forkView)
		footerHStack.addArrangedSubview(watcherView)
		footerHStack.addArrangedSubview(issuesView)
	}


	private func configureLanguageLabel() {
		footerHStack.addArrangedSubview(languageLabel)
		languageLabel.text = "TypeScript"
	}
}
