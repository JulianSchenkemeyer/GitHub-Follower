# GitHub-Watcher (In Development)

GitHub Watcher lets you search GitHub for users, view their profile and their public repositories. Through marking users and / or repositories as favorites, you can keep an eye on them and quickly access some basic statistical information.

Although the app can be used as intended, the goal of this project is to experiment with parts of the GitHub API, iOS networking calls, software design and unit tests.

## Features

- [x] Search GitHub for users
- [x] View the profile of GitHub users
- [x] Look at the public repositories. See how many forks exist for each repository, how many users are watching it and how many issues are currently open.
- [ ] Save users and / or repositories in your favorite list
- [ ] Cache data of users and repositories you marked as favorite in Core Data for offline access
- [ ] Add widgets showing saved users and repositories to your homescreen.

## Used Technologies

- Swift
- UIKit (UI is created programmatically)
- Core Data
- XCTest

## Used Patterns

- Model View Controller: Currently used as the basic architecture
- Coordinator: Used in order to decouple the view controller from each other

## Problems

- The RequestManager, which performs the network calls is currently used directly in the ViewController. While this does not have to be problematic, especially not if the view controller are quite small, it does complicate testing.

  One possible solution would be to not use the RequestManager instance directly but to use dependency injection.

- Currently the functions of the ViewController can not be tested without instantiating the whole ViewController. To improve testability here i am planning to switch to MVVM, which would allow for easier testing of the view model and to remove more functionality from the ViewControllers.
