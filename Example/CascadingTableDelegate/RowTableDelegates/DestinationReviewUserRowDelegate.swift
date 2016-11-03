//
//  DestinationReviewUserRowDelegate.swift
//  CascadingTableDelegate
//
//  Created by Ricardo Pramana Suranta on 11/2/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import CascadingTableDelegate

struct DestinationReviewUserRowViewModel {
	let userName: String
	let userReview: String
	let rating: Int
}

class DestinationReviewUserRowDelegate: CascadingBareTableDelegate {
	
	/// Cell identifier that will be used by this instance. Kindly register this on section-level delegate that will use this class' instance.
	static let cellIdentifier = DestinationReviewUserCell.nibIdentifier()
	
	private var viewModel: DestinationReviewUserRowViewModel?
	
	convenience init(viewModel: DestinationReviewUserRowViewModel) {
		self.init(index: 0, childDelegates: [])
		self.viewModel = viewModel
	}
	
}

extension DestinationReviewUserRowDelegate {		
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let identifier = DestinationReviewUserRowDelegate.cellIdentifier
		return tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		let userReview = viewModel?.userReview ?? ""
		return DestinationReviewUserCell.preferredHeight(userReview: userReview)
	}
	
	func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return DestinationReviewUserCell.preferredHeight(userReview: "")
	}
	
	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		
		guard let cell = cell as? DestinationReviewUserCell,
			let viewModel = viewModel else {
			return
		}
		
		cell.configure(
			userName: viewModel.userName,
			userReview: viewModel.userReview,
			rating: viewModel.rating
		)
		
		let lastRow = (index + 1) == parentDelegate?.childDelegates.count
		
		cell.hideBottomBorder = lastRow
	}
}