//
//  UserDetailViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 10.12.22.
//

import UIKit

class UserDetailViewController: UIViewController {

	weak var coordinator: SearchCoordinatorProtocol!
	var username: String!

	let vStackView = UIStackView()
	let headerView = UIView()
	let repositoryInfoView = UIView()
	let spacerView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()

		configure()

    }

	private func add(childVC: UIViewController, to containerView: UIView) {
		addChild(childVC)
		containerView.addSubview(childVC.view)
		childVC.view.frame = containerView.bounds
		childVC.view.translatesAutoresizingMaskIntoConstraints = false
		childVC.didMove(toParent: self)

		NSLayoutConstraint.activate([
			childVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
			childVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
			childVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
			childVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
		])
	}

	private func configure() {
		view.backgroundColor = .systemBackground

		configureVStackView()
		configureUIView(headerView, with: 300)
		configureUIView(repositoryInfoView, with: 210)

		vStackView.setCustomSpacing(300, after: repositoryInfoView)
		vStackView.addArrangedSubview(spacerView)

		add(childVC: GWUserHeaderViewController(), to: headerView)
		add(childVC: GWPublicRepositoriesInfoViewController(), to: repositoryInfoView)
	}

	private func configureVStackView() {
		view.addSubview(vStackView)
		vStackView.translatesAutoresizingMaskIntoConstraints = false
		vStackView.axis = .vertical
//		vStackView.distribution = .equalSpacing
		vStackView.alignment = .top
		vStackView.spacing = 0

		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			vStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	private func configureUIView(_ view: UIView, with itemHeight: CGFloat) {
		vStackView.addArrangedSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
//			view.heightAnchor.constraint(equalToConstant: itemHeight)
			view.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor)
		])
	}

	private func configureHeaderView() {
		view.addSubview(headerView)
		headerView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			headerView.heightAnchor.constraint(equalToConstant: 280)
		])

		add(childVC: GWUserHeaderViewController(), to: headerView)
	}
}
