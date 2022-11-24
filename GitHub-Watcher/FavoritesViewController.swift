//
//  FavoritesViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 24.11.22.
//

import UIKit

class FavoritesViewController: UIViewController {

	let labelView = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		view.backgroundColor = .systemBackground

		labelView.text = "Favorites"

		view.addSubview(labelView)
		labelView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			labelView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}


}
