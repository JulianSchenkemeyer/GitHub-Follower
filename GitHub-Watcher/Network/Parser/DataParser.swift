//
//  DataParser.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import Foundation

protocol DataParserProtocol {
	func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
	private var jsonDecoder: JSONDecoder

	init(jsonDecoder: JSONDecoder = JSONDecoder()) {
		self.jsonDecoder = jsonDecoder
		self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
		self.jsonDecoder.dateDecodingStrategy = .iso8601

	}

	func parse<T: Decodable>(data: Data) throws -> T {
		return try jsonDecoder.decode(T.self, from: data)
	}
}
