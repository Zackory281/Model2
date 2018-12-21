//
//  ShapeNode.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ShapeNode: NSObject, Positionable {
	
	// Positionable fields
	var fpoint: float2
	var gpoint: int2 {get{return fpoint.i2}set{fpoint = newValue.f2}}
	var direction: Direction = .RIGHT
	var moving: Bool
	var transientState: TrasientState
	var movement: ShapeMovement?
	
	weak var pathNode: PathNode?
	
	init(pathNode: PathNode) {
		self.moving = false
		self.pathNode = pathNode
		self.fpoint = pathNode.fpoint
		self.transientState = .Stopped
	}
}

struct ShapeMovement {
	let startTime: Time
	let duration: Time
	let startPoint: FP
	let delta: FP
}
enum TrasientState {
	case Stopped
	case Moving
}
