//
//  SearchCoordinator.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 04.12.22.
//

import Foundation
import UIKit
import SafariServices

protocol SearchCoordinatorProtocol: Coordinator {
	func findResults(for searchterm: String)
	func openDetails(for username: String)
	func showRepositories(for username: String)
	func openRepositoryInSafari(_ repositoryUrl: URL)
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
		let searchUserViewController = SearchUserViewController()
		searchUserViewController.coordinator = self
		searchUserViewController.searchterm = searchterm
		searchUserViewController.title = searchterm

		navigationController.pushViewController(searchUserViewController, animated: true)
	}

	func openDetails(for username: String) {
		let userDetailsViewController = UserDetailViewController()
		userDetailsViewController.coordinator = self
		userDetailsViewController.username = username
		userDetailsViewController.title = username

		navigationController.pushViewController(userDetailsViewController, animated: true)
	}

	func showRepositories(for username: String) {
		let searchRepositoryViewController = SearchRepositoriesViewController()
		searchRepositoryViewController.coordinator = self
		searchRepositoryViewController.searchterm = username
		searchRepositoryViewController.title = username

		navigationController.pushViewController(searchRepositoryViewController, animated: true)
	}

	func openRepositoryInSafari(_ repositoryUrl: URL) {
		let safariViewController = SFSafariViewController(url: repositoryUrl)
		safariViewController.preferredControlTintColor = .systemCyan

		navigationController.present(safariViewController, animated: true)
	}
}
