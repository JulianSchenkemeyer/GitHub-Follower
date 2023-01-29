//
//  SearchRepositoriesViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 16.01.23.
//

import UIKit

class SearchRepositoriesViewController: UIViewController {

	enum Section {
		case main
	}

	weak var coordinator: SearchCoordinatorProtocol!

	var searchterm: String!
	var repositories: [Repository] = []

	let requestManager = RequestManager()
	var collectionView: UICollectionView!
	var dataSource: UICollectionViewDiffableDataSource<Section, Repository>!


	override func viewDidLoad() {
		super.viewDidLoad()

		configure()
		searchRepositories()
	}


	private func searchRepositories() {
		Task {
			guard let repositories: [Repository] = try await requestManager.perform(RepositoryRequest.getRepositories(username: searchterm, page: 1)) else {

				print("something went wrong")
				return
			}
			self.repositories = repositories
			updateData()
		}
	}

	private func updateData() {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Repository>()
		snapshot.appendSections([.main])
		snapshot.appendItems(repositories, toSection: .main)
		dataSource.apply(snapshot, animatingDifferences: true)
	}


	private func configure() {
		configureCollectionView()
		configureDataSource()
	}

	private func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureFlowLayout())
		collectionView.delegate = self

		view.addSubview(collectionView)
		collectionView.backgroundColor = .systemBackground
		collectionView.register(RepositoryCell.self, forCellWithReuseIdentifier: RepositoryCell.reuseId)
	}

	private func configureFlowLayout() -> UICollectionViewFlowLayout {
		let xPadding: CGFloat = 20
		let yPadding: CGFloat = 10
		let rowHeight: Double  = 140

		return UIHelper.createSingleColumnFlowLayout(in: view, with: (xPadding, yPadding), and: rowHeight)
	}

	private func configureDataSource() {
		dataSource = UICollectionViewDiffableDataSource<Section, Repository>(collectionView: collectionView, cellProvider: { collectionView, indexPath, repository in

			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoryCell.reuseId, for: indexPath) as! RepositoryCell
			cell.set(name: repository.name)

			return cell
		})
	}
}

extension SearchRepositoriesViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		let selectedRepository = repositories[indexPath.item]
		let repoUrl = URL(string: selectedRepository.htmlUrl)!

		coordinator.openRepositoryInSafari(repoUrl)
	}
}

