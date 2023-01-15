//
//  FileManager.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 11.01.23.
//
import Foundation

protocol AssetManagerProtocol {
	func perform(_ request: AssetRequest) async throws -> Data
}

class AssetManager: AssetManagerProtocol {

	let urlSession: URLSession

	init(urlSession: URLSession = URLSession.shared) {
		self.urlSession = urlSession
	}

	func perform(_ request: AssetRequest) async throws -> Data {
		let urlRequest = try request.createUrlRequest()
		let (data, response) = try await urlSession.data(for: urlRequest)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
			throw NetworkError.InvalidResponse
		}

		return data
	}
}
