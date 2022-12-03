//
//  SearchRequestMock.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 01.12.22.
//

import Foundation
@testable import GitHub_Watcher


enum GetRequestMock: RequestProtocol {
	case get(filename: String)

	var path: String {
		switch self {
		case let .get(filename):
			guard let path = Bundle.main.path(forResource: filename, ofType: "json") else { return "" }
			return path
		}
	}

	var requestType: RequestType { .GET }
}
