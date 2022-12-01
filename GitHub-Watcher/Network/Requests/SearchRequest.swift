//
//  SearchRequest.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation


enum SearchRequest: RequestProtocol {
	case findMatchingUsers(searchString: String, page: Int)
	case findMatchingRepositories(searchString: String, page: Int)

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
		case let .findMatchingUsers(searchString, page):
			return ["q": searchString, "per_page": "100", "page": "\(page)"]
		case let .findMatchingRepositories(searchString, page):
			return ["q": searchString, "per_page": "100", "page": "\(page)"]
		}
	}

	var requestType: RequestType { .GET }
}
