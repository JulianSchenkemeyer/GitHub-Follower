//
//  DataRequest.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 03.01.23.
//

import Foundation


struct DataRequest: RequestProtocol {
	var path: String
	let requestType: RequestType = .GET

	init(urlString: String) {
		self.path = urlString
	}

	func createUrlRequest() throws -> URLRequest {
		guard let url = URL(string: self.path) else { throw NetworkError.InvalidUrl }

		return URLRequest(url: url)
	}
}

