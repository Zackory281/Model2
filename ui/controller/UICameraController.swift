//
//  UICameraController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/19/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import SpriteKit

class CameraController: NSObject, PanHandler, Scrollhandler {
	
	var camera: SKCameraNode
	
	init(_ camera: SKCameraNode) {
		self.camera = camera
		self.camera.xScale = 2
		self.camera.yScale = 2
	}
	var cursorDistFromCenter: CGPoint = .zero//need
	
	func beginPan(_ start: CGPoint, _ center: CGPoint) {
		self.ctrans = .zero
		cursorDistFromCenter = start - center
	}
	
	var zd: CGFloat = 1
	var ctrans: CGPoint = .zero
	var transBefore: CGPoint = .zero//need
	
	func updatePan(_ translation: CGPoint) {
		let velocity = translation - transBefore
		transBefore = translation
		camera.position -= velocity * camera.xScale
		cursorDistFromCenter += velocity
	}
	
	func updateScroll(_ deltaX: CGFloat, _ deltaY: CGFloat) {
		zd += deltaY * sensitivity
		let newScale = pow(2, zd)
	  	self.camera.position += cursorDistFromCenter * (camera.xScale - newScale)
		self.camera.xScale = newScale
		self.camera.yScale = newScale
	}
	
	func endPan() {
		self.ctrans = .zero
		cursorDistFromCenter = .zero
		transBefore = .zero
	}
}

let sensitivity: CGFloat = 0.03
