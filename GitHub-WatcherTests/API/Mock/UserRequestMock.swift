//
//  UserRequestMock.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation
@testable import GitHub_Watcher

enum UserRequestMock: RequestProtocol {
	case getFollowers
	case getUserInfo

	var path: String {
		switch self {
		case .getFollowers:
			guard let path = Bundle.main.path(forResource: "FollowersMock", ofType: "json") else { return "" }
			return path
		case .getUserInfo:
			guard let path = Bundle.main.path(forResource: "UserInfoMock", ofType: "json") else { return "" }
			return path
		}
	}

	var requestType: RequestType { .GET }
}
