//
//  RequestProtocol.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation


protocol RequestProtocol {
	var path: String { get }
	var headers: [String: String] { get }
	var urlParams: [String: String?] { get }
	var requestType: RequestType { get }
}

extension RequestProtocol {
	var host: String { APIConstants.host }
	var headers: [String: String] { [:] }
	var urlParams: [String: String?] { [:] }


	func createUrlRequest() throws -> URLRequest {
		let url = try createUrl()
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = requestType.rawValue

		if !headers.isEmpty {
			urlRequest.allHTTPHeaderFields = headers
		}


		return urlRequest
	}

	private func createUrl() throws -> URL {
		var components = URLComponents()
		components.scheme = "https"
		components.host = host
		components.path = path

		if !urlParams.isEmpty {
			components.queryItems = urlParams.map({ (key: String, value: String?) in
				URLQueryItem(name: key, value: value)
			})
		}

		guard let url = components.url else {
			throw NetworkError.InvalidUrl
		}
		return url
	}
}
