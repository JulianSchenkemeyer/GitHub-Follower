//
//  Follower.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation

struct UserReference: Codable, Hashable {
	var login: String
	var avatarUrl: String
}
