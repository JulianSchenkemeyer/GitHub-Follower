//
//  RepositoryRequestMock.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import Foundation
@testable import GitHub_Watcher

enum RepositoryRequestMock: RequestProtocol {
	case getRepository
	case getRepositories

	var path: String {
		switch self {
		case .getRepository:
			guard let path = Bundle.main.path(forResource: "RepositoryMock", ofType: "json") else { return "" }
			return path
		case .getRepositories:
			guard let path = Bundle.main.path(forResource: "RepositoriesMock", ofType: "json") else { return "" }
			return path
		}
	}

	var requestType: RequestType { .GET }
}
