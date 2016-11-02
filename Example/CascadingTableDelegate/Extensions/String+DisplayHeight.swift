//
//  String+DisplayHeight.swift
//  CascadingTableDelegate
//
//  Created by Ricardo Pramana Suranta on 10/31/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

extension String {
	
	/**
	Returns expected height to display this value, with passed `width` and `font`.
	
	- parameter width: `CGFloat` representation value on how wide this `String` will be presented.
	- parameter font:  `UIFont` hat will be used to present this `String`.
	
	- returns: `CGFloat` value.
	*/
	func displayHeight(width width: CGFloat, font: UIFont) -> CGFloat {
		
		let maxSize = CGSize(width: width, height: CGFloat.infinity)
		
		let actualSize = self.boundingRectWithSize(
			maxSize,
			options: [ .UsesFontLeading, .UsesLineFragmentOrigin ],
			attributes: [ NSFontAttributeName: font ],
			context: nil
		)
		
		return actualSize.height
	}
}

