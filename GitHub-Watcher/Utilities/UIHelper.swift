//
//  UIHelper.swift
//  GitHub-Watcher
//
//  Created by Julian Schenkemeyer on 15.01.23.
//

import UIKit


enum UIHelper {
	static func createSingleColumnFlowLayout(in view: UIView, with padding: (xAxis: CGFloat, yAxis: CGFloat), and rowHeight: Double) -> UICollectionViewFlowLayout {
		let width = view.bounds.width
		let xPadding: CGFloat = padding.xAxis
		let yPadding: CGFloat = padding.yAxis

		let availableWidth = width - (2 * xPadding)
		let itemWidth = availableWidth
		let itemHeight: Double = rowHeight

		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.sectionInset = UIEdgeInsets(top: yPadding, left: xPadding, bottom: yPadding, right: xPadding)
		flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)

		return flowLayout
	}
}
