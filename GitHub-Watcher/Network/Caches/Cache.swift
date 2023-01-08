//
//  ImageCache.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 05.01.23.
//

import UIKit


class Cache {
	static let shared = Cache()

	let images = NSCache<NSString, UIImage>()

	private init() {}
}
