//
//  RepositoryRequest.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation


enum RepositoryRequest: RequestProtocol {
	case getRepository(username: String, repoName: String)
	case getRepositories(username: String, page: Int)

	var path: String {
		switch self {
		case let .getRepositories(username, _):
			return "/users/\(username)/repos"
		case let .getRepository(username, repoName):
			return "/repos/\(username)/\(repoName)"
		}
	}

	var urlParams: [String : String?] {
		switch self {
		case let .getRepositories(_, page):
			return ["per_page": "100", "page": "\(page)"]
		case .getRepository:
			return [:]
		}
	}
	
	var requestType: RequestType { .GET }
}
