//
//  CreateUrlRequestTest.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 29.11.22.
//

import XCTest
@testable import GitHub_Watcher

final class CreateUrlRequestTest: XCTestCase {

	//MARK: Helper
	private func containsSameQueryParams(_ actual: URL, expected: URL) -> Bool {
		actual.query()?.allSatisfy { expected.query()?.contains($0) ?? false } ?? false
	}

	private enum RequestWith: RequestProtocol {
		case invalidUrl
		case customHeader

		var path: String {
			switch self {
			case .invalidUrl:
				return "test"
			case .customHeader:
				return "/custom-header"
			}
		}

		var headers: [String : String] {
			switch self {
			case .invalidUrl:
				return [:]
			case .customHeader:
				return ["custom1": "test", "valid-for": "1000"]
			}
		}

		var requestType: RequestType { .GET }


	}


	//MARK: Tests
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

		let expectedUrl = URL(string: "https://api.github.com/users/JulianSchenkemeyer/followers?per_page=100&page=1")!

		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}
		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)

		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateFollowersRequestWithSecondPage() throws {
		guard let urlRequest = try? UserRequest.getFollowers(username: "JulianSchenkemeyer", page: 2).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		let expectedUrl = URL(string: "https://api.github.com/users/JulianSchenkemeyer/followers?per_page=100&page=2")!
		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}
		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateRepositoriesRequest() throws {
		guard let urlRequest = try? RepositoryRequest.getRepositories(username: "JulianSchenkemeyer", page: 1).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		let expectedUrl =  URL(string: "https://api.github.com/users/JulianSchenkemeyer/repos?per_page=100&page=1")!
		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}
		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateRepositoriesRequestWithSecondPage() throws {
		guard let urlRequest = try? RepositoryRequest.getRepositories(username: "JulianSchenkemeyer", page: 2).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		let expectedUrl = URL(string: "https://api.github.com/users/JulianSchenkemeyer/repos?per_page=100&page=2")!
		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}
		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateRepositoryRequest() throws {
		guard let urlRequest = try? RepositoryRequest.getRepository(username: "JulianSchenkemeyer", repoName: "GitHub-Watcher").createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		XCTAssertEqual(urlRequest.url, URL(string: "https://api.github.com/repos/JulianSchenkemeyer/GitHub-Watcher"))
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateSearchUserRequest() throws {
		guard let urlRequest = try? SearchRequest.findMatchingUsers(searchString: "test", page: 1, perPage: 100).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		let expectedUrl = URL(string: "https://api.github.com/search/users?q=test%20in:login&per_page=100&page=1")!
		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}
		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateSearchRepoRequest() throws {
		guard let urlRequest = try? SearchRequest.findMatchingRepositories(searchString: "test", page: 1, perPage: 100).createUrlRequest() else {
			XCTFail("❌ failed to create UrlRequest")
			return
		}

		let expectedUrl = URL(string: "https://api.github.com/search/repositories?q=test%20in:name&per_page=100&page=1")!
		guard let url = urlRequest.url else {
			XCTFail("❌ URLRequest contains no valid url")
			return
		}

		XCTAssertTrue(containsSameQueryParams(url, expected: expectedUrl))
		XCTAssertEqual(url.path(), expectedUrl.path())
		XCTAssertEqual(url.baseURL, expectedUrl.baseURL)
		XCTAssertEqual(url.scheme, expectedUrl.scheme)
		XCTAssertEqual(urlRequest.httpMethod, RequestType.GET.rawValue)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, [:])
	}

	func testCreateRequestWithMalFormedUrl() throws {
		if let _ = try? RequestWith.invalidUrl.createUrlRequest() {
			XCTFail("❌ URL should be invalid")
		}
	}

	func testCreateRequestWithCustomHeaders() throws {
		guard let urlRequest = try? RequestWith.customHeader.createUrlRequest() else {
			XCTFail("❌ failed to create URLRequest")
			return
		}

		XCTAssertEqual(urlRequest.url, URL(string: "https://api.github.com/custom-header"))
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["custom1": "test", "valid-for": "1000"])
	}
}
