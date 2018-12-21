//
//  GameView.swift
//  Model2
//
//  Created by Zackory Cramer on 12/19/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import Cocoa
import SpriteKit

class GameView: SKView, NSGestureRecognizerDelegate, UIInput {
	
	var pan: NSGestureRecognizer?
	var scroll: NSGestureRecognizer?
	weak var panHandler: PanHandler?
	weak var scrollHandler: Scrollhandler?
	
	@objc func handleScroll(sender: NSMagnificationGestureRecognizer) {
		print("scrolled")
	}
	
	override func scrollWheel(with event: NSEvent) {
		guard let handler = scrollHandler else {
			return
		}
		handler.updateScroll(event.deltaX, event.deltaY)
	}
	
	var mouseDown: Bool = false
	var startPos: NSPoint?
	
	override func mouseDown(with event: NSEvent) {
		guard let handler = panHandler else {
			return
		}
		mouseDown = true
		startPos = event.locationInWindow
		handler.beginPan(CGPoint(x: startPos!.x, y: startPos!.y), CGPoint(x: bounds.width / 2, y: bounds.height / 2))
	}
	
	override func mouseDragged(with event: NSEvent) {
		guard mouseDown, let handler = panHandler else {
			return
		}
		handler.updatePan(event.locationInWindow - startPos!)
	}
	
	override func mouseUp(with event: NSEvent) {
		guard let handler = panHandler else {
			return
		}
		mouseDown = false
		handler.endPan()
	}
	
	func initialize() {
		//pan = NSPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
		//scroll = NSGestureRecognizer(target: self, action: #selector(handleScroll(sender:)))
		//pan!.delegate = self
		//scroll!.delegate = self
		//self.addGestureRecognizer(pan!)
		//self.addGestureRecognizer(scroll!)
	}
	
	func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: NSGestureRecognizer) -> Bool {
		print("shouldRequireFailureOf", otherGestureRecognizer)
		return false
	}
	
	func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: NSGestureRecognizer) -> Bool {
		print("shouldBeRequiredToFailBy", otherGestureRecognizer)
		return false
	}
	
	func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: NSGestureRecognizer) -> Bool {
		print("shouldRecognizeSimultaneouslyWith", gestureRecognizer, otherGestureRecognizer)
		return true
	}
	func gestureRecognizerShouldBegin(_ gestureRecognizer: NSGestureRecognizer) -> Bool {
		print("gestureRecognizerShouldBegin", gestureRecognizer)
		return true
	}
	func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldAttemptToRecognizeWith event: NSEvent) -> Bool {
		print("shouldAttemptToRecognizeWith: ", gestureRecognizer, event)
		return true
	}
	func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldReceive touch: NSTouch) -> Bool {
		print("shouldReceive: ", gestureRecognizer, touch)
		return true
	}
}

protocol UIInput {
	var panHandler: PanHandler? { get set }
	var scrollHandler: Scrollhandler? { get set }
}
