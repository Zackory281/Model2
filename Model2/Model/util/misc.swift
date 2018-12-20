//
//  misc.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

typealias IntC = Int32
typealias FloatC = Float
typealias PATHID = UInt16
typealias TickPri = UInt8
typealias GP = GPoint
typealias FP = FPoint
typealias GPoint = int2
typealias FPoint = float2
typealias Time = Double

enum Direction: UInt8 {
	case UP = 0
	case RIGHT = 1
	case DOWN = 2
	case LEFT = 3
	
	func opposite() -> Direction {
		return Direction(rawValue: (self.rawValue + 2) % 4)!
	}
	func right() -> Direction {
		return Direction(rawValue: (self.rawValue + 1) % 4)!
	}
	func left() -> Direction {
		return Direction(rawValue: (self.rawValue + 3) % 4)!
	}
}

let DirectionToVector: [Direction : float2] = [
	.UP    : float2(0, 1),
	.RIGHT : float2(1, 0),
	.DOWN  : float2(0, -1),
	.LEFT  : float2(-1, 0),
]

let tickTime: TimeInterval = 1 / 60.0
