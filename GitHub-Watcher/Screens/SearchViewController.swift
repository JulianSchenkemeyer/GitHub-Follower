//
//  SearchViewController.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 24.11.22.
//

import UIKit

class SearchViewController: UIViewController {

	let imageView = UIImageView()
	let searchTextfield = GWTextfield(placeholder: "Enter Your Searchterm")
	let callToActionButton = GWButton(color: .systemCyan, title: "Search")

	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}

	@objc private func pushSearchResultViewController() {
		guard let searchterm = searchTextfield.text, !searchterm.isEmpty else {
			print("❌ no searchterm specified")
			return
		}

		let normalizedSearchterm = searchterm.trimmingCharacters(in: .whitespacesAndNewlines)
		guard !normalizedSearchterm.isEmpty else {
			print("❌ no searchterm specified")
			return
		}

		let searchResultsViewController = SearchResultsViewController()
		searchResultsViewController.searchterm = normalizedSearchterm
		searchResultsViewController.title = normalizedSearchterm

		navigationController?.pushViewController(searchResultsViewController, animated: true)
	}

	private func configure() {
		view.backgroundColor = .systemBackground

		configureImageView()
		configureSearchTextfield()
		configureCallToActionButton()

		createDissmissKeyboardTapGesture()
	}

	private func configureImageView() {
		view.addSubview(imageView)

		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(systemName: "magnifyingglass.circle.fill",
								  withConfiguration: UIImage.SymbolConfiguration(paletteColors: [.systemBackground, .systemCyan]))

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 200),
			imageView.widthAnchor.constraint(equalToConstant: 200)
		])
	}

	private func configureSearchTextfield() {
		view.addSubview(searchTextfield)

		searchTextfield.returnKeyType = .search
		searchTextfield.delegate = self

		NSLayoutConstraint.activate([
			searchTextfield.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
			searchTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			searchTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			searchTextfield.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	private func configureCallToActionButton() {
		view.addSubview(callToActionButton)

		callToActionButton.addTarget(self, action: #selector(pushSearchResultViewController), for: .touchUpInside)

		NSLayoutConstraint.activate([
			callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
			callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			callToActionButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	private func createDissmissKeyboardTapGesture() {
		let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
		view.addGestureRecognizer(tap)
	}
}

extension SearchViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		pushSearchResultViewController()

		return true
	}
}
