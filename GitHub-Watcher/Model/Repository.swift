//
//  Repository.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation

struct Repository: Codable {
	let name: String
	let owner: Owner
	let hasIssues: Bool
	let forks: Int
	let watchers: Int
	let openIssues: Int
	let pushedAt: Date
}

struct Owner: Codable {
	let login: String
	let avatarUrl: String
}
