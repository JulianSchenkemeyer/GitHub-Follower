//
//  GWImageView.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 05.01.23.
//

import UIKit

class GWImageView: UIImageView {
	let requestManager = RequestManager()
	let imageCache = Cache.shared.images

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func downloadImage(from url: String) {
		let cacheKey = NSString(string: url)
		if let image = imageCache.object(forKey: cacheKey) {
			self.image = image
			return
		}

		Task {
			guard let data = try? await requestManager.loadData(from: url) else { return }
			guard let image = UIImage(data: data) else { return }
			self.image = image
			self.imageCache.setObject(image, forKey: cacheKey)
		}
	}
}
