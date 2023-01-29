//
//  Repository.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation

struct Repository: Codable, Hashable {
	let name: String
	let owner: UserReference
	let language: String?

	let hasIssues: Bool
	let forks: Int
	let watchers: Int
	let openIssues: Int
	let pushedAt: Date
}
