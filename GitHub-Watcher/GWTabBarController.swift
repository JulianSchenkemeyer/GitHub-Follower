//
//  GWTabBarController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 24.11.22.
//

import UIKit

class GWTabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		UITabBar.appearance().tintColor = .systemCyan
		viewControllers = [createSearchNavigationController(), createFavoritesListNavigationController()]
	}

	func createSearchNavigationController() -> UINavigationController {
		let searchNavigationController = SearchViewController()
		searchNavigationController.title = "Search GitHub"
		searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

		return UINavigationController(rootViewController: searchNavigationController)
	}

	func createFavoritesListNavigationController() -> UINavigationController {
		let favoritesListNavigationController = FavoritesViewController()
		favoritesListNavigationController.title = "Favorites"
		favoritesListNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

		return UINavigationController(rootViewController: favoritesListNavigationController)
	}
}
