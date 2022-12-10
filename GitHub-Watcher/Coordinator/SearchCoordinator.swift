//
//  SearchCoordinator.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 04.12.22.
//

import Foundation
import UIKit

protocol SearchCoordinatorProtocol: Coordinator {
	func findResults(for searchterm: String)
}

final class SearchCoordinator: SearchCoordinatorProtocol {
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

	func findResults(for searchterm: String) {
		let searchResultsViewController = SearchResultsViewController()
		searchResultsViewController.searchterm = searchterm
		searchResultsViewController.title = searchterm

		navigationController.pushViewController(searchResultsViewController, animated: true)
	}
}
