//
//  FollowersRequest.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation


enum UserRequest: RequestProtocol {
	case getFollowers(username: String, page: Int)
	case getUserInfo(username: String)

	var path: String {
		switch self {
		case let .getFollowers(username, _):
			return "/users/\(username)/followers"
		case let .getUserInfo(username):
			return "/users/\(username)"
		}
	}
	var urlParams: [String : String?] {
		switch self {
		case let .getFollowers(_, page):
			return ["per_page": "100", "page": "\(page)"]
		case .getUserInfo:
			return [:]
		}
	}

	var requestType: RequestType {
		.GET
	}
}
