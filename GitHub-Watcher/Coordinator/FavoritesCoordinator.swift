//
//  FavoritesCoordinator.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 05.12.22.
//

import Foundation
import UIKit

final class FavoritesCoordinator: Coordinator {
	var navigationController: UINavigationController

	init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true

		let favoritesListNavigationController = FavoritesViewController()
		favoritesListNavigationController.title = "Favorites"
		favoritesListNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
		favoritesListNavigationController.coordinator = self

		navigationController.viewControllers = [favoritesListNavigationController]
	}
}
