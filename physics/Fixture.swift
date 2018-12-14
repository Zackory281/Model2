//
//  Fixture.swift
//  Model2
//
//  Created by Zackory Cramer on 12/6/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class Fixture {
	
	let vets: [float2]
	let edgs: [(Int, Int)]
	var pos: float2
	
	init(_ vets: [float2], _ edgs: [(Int, Int)], _ pos: float2) {
		self.vets = vets
		self.edgs = edgs
		self.pos = pos
	}
	
}

struct PointMotion {
	
	let v1: float2
	let v2: float2
	
	func getPos(at time: float_t) -> float2 {
		return v1 + time * (v2 - v1)
	}
	
}
