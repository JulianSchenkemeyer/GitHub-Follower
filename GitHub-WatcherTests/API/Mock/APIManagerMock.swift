//
//  APIManagerMock.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation
@testable import GitHub_Watcher

struct APIManagerMock: APIManagerProtocol {
	func perform(_ request: RequestProtocol) async throws -> Data {
		let url = URL(fileURLWithPath: request.path)
		let data = try Data(contentsOf: url, options: .mappedIfSafe)
		return data
	}
}
