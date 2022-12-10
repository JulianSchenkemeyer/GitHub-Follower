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
		guard let followers: [UserReference] = try await requestManager?.perform(GetRequestMock.get(filename: "FollowersMock")) else {
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
		guard let user: User = try await requestManager?.perform(GetRequestMock.get(filename: "UserInfoMock")) else {
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

	func testGetRepository() async throws {
		guard let repository: Repository = try await requestManager?.perform(GetRequestMock.get(filename: "RepositoryMock")) else {
			XCTFail("❌ could not create repository object")
			return
		}

		XCTAssertEqual(repository.name, "repo1")
		XCTAssertEqual(repository.hasIssues, false)
		XCTAssertEqual(repository.forks, 22)
		XCTAssertEqual(repository.watchers, 500)
		XCTAssertEqual(repository.openIssues, 0)
		let expectedDate = dateFormatter?.date(from: "2015-01-15T13:57:25Z")
		XCTAssertEqual(repository.pushedAt, expectedDate)

		let owner = repository.owner
		XCTAssertEqual(owner.login, "JulianSchenkemeyer")
		XCTAssertEqual(owner.avatarUrl, "https://avatars.githubusercontent.com/u/10547673?v=4")
	}

	func testGetRepositories() async throws {
		guard let repositories: [Repository] = try await requestManager?.perform(GetRequestMock.get(filename: "RepositoriesMock")) else {
			XCTFail("❌ could not create repository object")
			return
		}

		XCTAssertEqual(repositories.count, 2)

		let first = repositories.first
		XCTAssertEqual(first?.name, "repo1")

		let last = repositories.last
		XCTAssertEqual(last?.name, "repo2")
	}

	func testGetSearchResultForUsers() async throws {
		guard let searchUsersResult: UserSearchResults = try await requestManager?.perform(GetRequestMock.get(filename: "SearchUsersMock")) else {
			XCTFail("❌ could not create repository object")
			return
		}

		XCTAssertEqual(searchUsersResult.totalCount, 2)
		XCTAssertEqual(searchUsersResult.incompleteResults, false)
		XCTAssertEqual(searchUsersResult.items.count, 2)

		let first = searchUsersResult.items.first
		XCTAssertEqual(first?.login, "user1")

		let last = searchUsersResult.items.last
		XCTAssertEqual(last?.login, "user2")
	}

	func testGetSearchResultForRepositories() async throws {
		guard let searchRepositoriesResult: RepositorySearchResults = try await requestManager?.perform(GetRequestMock.get(filename: "SearchRepositoriesMock")) else {
			XCTFail("❌ could not create repository object")
			return
		}

		XCTAssertEqual(searchRepositoriesResult.totalCount, 2)
		XCTAssertEqual(searchRepositoriesResult.incompleteResults, false)
		XCTAssertEqual(searchRepositoriesResult.items.count, 2)

		let first = searchRepositoriesResult.items.first
		XCTAssertEqual(first?.name, "repo1")

		let last = searchRepositoriesResult.items.last
		XCTAssertEqual(last?.name, "repo2")
	}
}

