//
//  ViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 22.11.22.
//

import UIKit

class ViewController: UIViewController {

	let labelView = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		view.backgroundColor = .systemBackground

		labelView.text = "Hello world!"

		view.addSubview(labelView)
		labelView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			labelView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}


}

