//
//  RequestManagerTests.swift
//  GitHub-WatcherTests
//
//  Created by Julian Schenkemeyer on 27.11.22.
//

import XCTest
@testable import GitHub_Watcher

final class RequestManagerTests: XCTestCase {

	private var requestManager: RequestManagerProtocol?
	private var dateFormatter: DateFormatter?

	override func setUp() {
		super.setUp()

		requestManager = RequestManager(apiManager: APIManagerMock())
		dateFormatter = DateFormatter()
		dateFormatter?.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
	}

	func testGetFollowers() async throws {
		guard let followers: [Follower] = try await requestManager?.perform(UserRequestMock.getFollowers) else {
			XCTFail("❌ did not get data from request manager")
			return
		}

		XCTAssertEqual(followers.count, 2)

		let first = followers.first
		XCTAssertEqual(first?.login, "user1")

		let last = followers.last
		XCTAssertEqual(last?.login, "user2")
	}

	func testGetUserInfo() async throws {
		guard let user: User = try await requestManager?.perform(UserRequestMock.getUserInfo) else {
			XCTFail("❌ did not get data from request manager")
			return
		}

		XCTAssertEqual(user.login, "JulianSchenkemeyer")
		XCTAssertEqual(user.avatarUrl, "https://avatars.githubusercontent.com/u/10547673?v=4")
		XCTAssertEqual(user.name, "Julian Schenkemeyer")
		XCTAssertEqual(user.location, nil)
		XCTAssertEqual(user.bio, nil)
		XCTAssertEqual(user.publicRepos, 4)
		XCTAssertEqual(user.publicGists, 1)
		XCTAssertEqual(user.htmlUrl, "https://github.com/JulianSchenkemeyer")
		XCTAssertEqual(user.following, 0)
		XCTAssertEqual(user.followers, 0)
		let expectedDate = dateFormatter?.date(from: "2015-01-15T13:57:25Z")
		XCTAssertEqual(user.createdAt, expectedDate)
	}
}

