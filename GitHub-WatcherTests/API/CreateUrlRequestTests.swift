//
//  CreateUrlRequestTest.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import XCTest
@testable import GitHub_Watcher

final class CreateUrlRequestTest: XCTestCase {

    func testCreateUserInfoRequest() throws {
		guard let urlRequest = try? UserRequest.getUserInfo(username: "JulianSchenkemeyer").createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		XCTAssertEqual(urlRequest.url, URL(string: "https://api.github.com/users/JulianSchenkemeyer"))
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
    }

	func testCreateFollowersRequest() throws {
		guard let urlRequest = try? UserRequest.getFollowers(username: "JulianSchenkemeyer", page: 1).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		XCTAssertEqual(urlRequest.url, URL(string: "https://api.github.com/users/JulianSchenkemeyer/followers?per_page=100&page=1"))
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateFollowersRequestWithSecondPage() throws {
		guard let urlRequest = try? UserRequest.getFollowers(username: "JulianSchenkemeyer", page: 2).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		XCTAssertEqual(urlRequest.url, URL(string: "https://api.github.com/users/JulianSchenkemeyer/followers?per_page=100&page=2"))
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateRequestWithMalFormedUrl() throws {

	}

	func testCreateRequestWithCustomHeaders() throws {

	}
}
