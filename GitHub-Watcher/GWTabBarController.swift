//
//  GWTabBarController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 24.11.22.
//

import UIKit

class GWTabBarController: UITabBarController {

	let searchCoordinator = SearchCoordinator()
	let favoritesCoordinator = FavoritesCoordinator()

	override func viewDidLoad() {
		super.viewDidLoad()

		UITabBar.appearance().tintColor = .systemCyan
		viewControllers = [searchCoordinator.navigationController, favoritesCoordinator.navigationController]
	}
}
