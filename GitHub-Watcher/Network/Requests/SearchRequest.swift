//
//  SearchRequest.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation


enum SearchRequest: RequestProtocol {
	case findMatchingUsers(searchString: String, page: Int, perPage: Int)
	case findMatchingRepositories(searchString: String, page: Int, perPage: Int)

	var path: String {
		switch self {
		case .findMatchingUsers:
			return "/search/users"
		case .findMatchingRepositories:
			return "/search/repositories"
		}
	}

	var urlParams: [String : String?] {
		switch self {
		case let .findMatchingUsers(searchString, page, perPage):
			return ["q": "\(searchString) in:login", "per_page": "\(perPage)", "page": "\(page)"]
		case let .findMatchingRepositories(searchString, page, perPage):
			return ["q": "\(searchString) in:name", "per_page ": "\(perPage)", "page": "\(page)"]
		}
	}

	var requestType: RequestType { .GET }
}
