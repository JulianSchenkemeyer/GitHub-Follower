//
//  GWLabelWithSystemImageView.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 28.01.23.
//

import UIKit

enum SupportedLabelSystemImages {
	case fork, watcher, issues
}

class GWLabelWithSystemImageView: UIView {

	var systemImageView: UIImageView = UIImageView()
	var labelView = GWTitleLabel(textAlignment: .left, fontSize: 14)

	override init(frame: CGRect) {
		super.init(frame: .zero)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init(symbol: SupportedLabelSystemImages, title: String) {
		self.init(frame: .zero)

		switch symbol {
		case .fork:
			systemImageView.image = UIImage(systemName: "tuningfork")
		case .watcher:
			systemImageView.image = UIImage(systemName: "binoculars.fill")
		case .issues:
			systemImageView.image = UIImage(systemName: "square.and.pencil")
		}

		labelView.text = title
	}

	convenience init(symbol: SupportedLabelSystemImages) {
		self.init(symbol: symbol, title: "")
	}

	func set(title: String) {
		labelView.text = title
	}

	private func configure() {
		configureSystemImageView()
		configureLabelView()
	}

	private func configureSystemImageView() {
		addSubview(systemImageView)

		systemImageView.translatesAutoresizingMaskIntoConstraints = false
		systemImageView.contentMode = .scaleAspectFill
		systemImageView.tintColor = .label

		NSLayoutConstraint.activate([
			systemImageView.topAnchor.constraint(equalTo: self.topAnchor),
			systemImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			systemImageView.widthAnchor.constraint(equalToConstant: 20),
			systemImageView.heightAnchor.constraint(equalToConstant: 20)
		])
	}

	private func configureLabelView() {
		addSubview(labelView)


		labelView.text = ""

		NSLayoutConstraint.activate([
			labelView.centerYAnchor.constraint(equalTo: systemImageView.centerYAnchor),
			labelView.leadingAnchor.constraint(equalTo: systemImageView.trailingAnchor, constant: 10),
			labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			labelView.heightAnchor.constraint(equalToConstant: 18)
		])
	}
}
