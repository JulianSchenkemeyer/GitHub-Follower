//
//  UserDetailViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 10.12.22.
//

import UIKit

class UserDetailViewController: UIViewController {

	weak var coordinator: SearchCoordinatorProtocol!
	let requestManager = RequestManager()
	var username: String!

	let vStackView = UIStackView()
	let headerView = UIView()
	let repositoryInfoView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()

		configure()
		getUserInfo()
    }

	private func getUserInfo() {
		Task {
			do {
				let user: User = try await requestManager.perform(UserRequest.getUserInfo(username: username))
				configureUI(for: user)
			} catch {
				print("Something went wrong", error.localizedDescription)
			}
		}
	}

	private func configureUI(for user: User) {
		add(childVC: GWUserHeaderViewController(user: user), to: headerView)
		add(childVC: GWPublicRepositoriesInfoViewController(repositories: user.publicRepos, delegate: self), to: repositoryInfoView)

		adjustHeightOfVStack()
	}

	private func add(childVC: UIViewController, to containerView: UIView) {
		addChild(childVC)
		containerView.addSubview(childVC.view)
		childVC.view.frame = containerView.bounds
		childVC.view.translatesAutoresizingMaskIntoConstraints = false
		childVC.didMove(toParent: self)

		NSLayoutConstraint.activate([
			childVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
			childVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
			childVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
			childVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
		])
	}

	private func configure() {
		view.backgroundColor = .systemBackground

		configureVStackView()
		configureUIView(headerView, with: 270)
		configureUIView(repositoryInfoView, with: 180)
	}

	private func configureVStackView() {
		view.addSubview(vStackView)
		vStackView.translatesAutoresizingMaskIntoConstraints = false
		vStackView.axis = .vertical
		vStackView.alignment = .top
		vStackView.spacing = 0

		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}

	private func adjustHeightOfVStack() {
		let vStackBottom = vStackView.heightAnchor.constraint(greaterThanOrEqualTo: repositoryInfoView.heightAnchor, multiplier: 1.5)
		vStackView.addConstraint(vStackBottom)
	}

	private func configureUIView(_ view: UIView, with itemHeight: CGFloat) {
		vStackView.addArrangedSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			view.heightAnchor.constraint(equalToConstant: itemHeight),
			view.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor)
		])
	}
}

extension UserDetailViewController: GWPublicRepositoriesInfoDelegate {
	func didTaShowPublicRepositories() {
		coordinator.showRepositories(for: self.username)
	}
}
