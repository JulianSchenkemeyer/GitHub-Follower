//
//  SearchCoordinator.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 04.12.22.
//

import Foundation
import UIKit

final class SearchCoordinator: Coordinator {
	var navigationController: UINavigationController

	init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true

		let searchNavigationController = SearchViewController()
		searchNavigationController.title = "Search GitHub"
		searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		searchNavigationController.coordinator = self

		navigationController.viewControllers = [searchNavigationController]
	}
}
