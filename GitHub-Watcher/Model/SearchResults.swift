//
//  SearchResults.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation

protocol SearchResults {
	var totalCount: Int { get }
	var incompleteResults: Bool { get }
}

struct UserSearchResults: SearchResults, Codable {
	var totalCount: Int
	var incompleteResults: Bool

	let items: [User]
}

struct RepositorySearchResults: SearchResults, Codable {
	var totalCount: Int
	var incompleteResults: Bool

	let items: [Repository]
}
