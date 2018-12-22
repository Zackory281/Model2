//
//  UIHandlers.swift
//  Model2
//
//  Created by Zackory Cramer on 12/20/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

protocol PanHandler: AnyObject {
	func beginPan(_ start: CGPoint, _ center: CGPoint)
	func updatePan(_ translation: CGPoint)
	func endPan()
}

protocol Scrollhandler: AnyObject {
	func updateScroll(_ deltaX: CGFloat, _ deltaY: CGFloat)
}

protocol HoverHandler: AnyObject {
	func updateHover(_ point: CGPoint)
}

protocol ClickHandler: AnyObject {
	func clicked(_ point: CGPoint)
}
