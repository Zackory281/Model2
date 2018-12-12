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
	var direction: Direction = .UP
	var moved: Bool
	
	weak var pathNode: PathNode? {didSet{moved=true}}
	
	init(pathNode: PathNode) {
		self.moved = true
		self.pathNode = pathNode
		self.fpoint = pathNode.fpoint
	}
}
