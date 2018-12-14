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
typealias Tick = UInt32
typealias PATHID = UInt16
typealias TickPri = UInt8
typealias GP = GPoint
typealias FP = FPoint
typealias GPoint = int2
typealias FPoint = float2

extension FPoint {
	var cgPoint: CGPoint { return CGPoint(x: CGFloat(x * 100), y: CGFloat(y * 100))}
}
//struct GPoint: CustomStringConvertible, Hashable {
//
//	var ip: int2
//	var x: IntC { return ip.y }
//	var y: IntC { return ip.y }
//
//	init(_ x: IntC, _ y: IntC) {
//		self.ip = int2(x, y)
//	}
//
//	func getFPoint() -> FPoint {
//		return FPoint(FloatC(x), FloatC(y))
//	}
//
//	var description: String { get { return "(\(x), \(y))"}}
//
//	static var zero = GPoint(0, 0)
//
//	static func == (lhs: GPoint, rhs: GPoint) -> Bool {
//		return lhs.x == rhs.x && lhs.y == rhs.y
//	}
//
//	func hash(into hasher: inout Hasher) {
//		hasher.combine(x)
//		hasher.combine(y)
//	}
//}
//
//struct FPoint: CustomStringConvertible, Hashable {
//
//	var f: float2
//
//	init(_ x: FloatC, _ y: FloatC) {
//		f = float2(x, y)
//	}
//
//	func getGPoint() -> GPoint {
//		return GPoint(IntC(f.x), IntC(f.y))
//	}
//
//	var description: String { get { return "(\(f.x), \(f.y))"}}
//
//	static var zero = FPoint(0, 0)
//
//	static func == (lhs: FPoint, rhs: FPoint) -> Bool {
//		return lhs.f.x == rhs.f.x && lhs.f.y == rhs.f.y
//	}
//
//	func hash(into hasher: inout Hasher) {
//		hasher.combine(f.x)
//		hasher.combine(f.y)
//	}
//}

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
}

let DirectionToVector: [Direction : float2] = [
	.UP    : float2(0, 1),
	.RIGHT : float2(1, 0),
	.DOWN  : float2(0, -1),
	.LEFT  : float2(-1, 0),
]

let tickTime: TimeInterval = 1 / 60.0
