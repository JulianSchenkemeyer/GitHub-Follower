//
//  APIManager.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation


protocol APIManagerProtocol {
	func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {

	let urlSession: URLSession

	init(urlSession: URLSession = URLSession.shared) {
		self.urlSession = urlSession
	}

	func perform(_ request: RequestProtocol) async throws -> Data {
		let urlRequest = try request.createUrlRequest()
		let (data, response) = try await urlSession.data(for: urlRequest)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
			throw NetworkError.InvalidResponse
		}

		return data
	}
}
