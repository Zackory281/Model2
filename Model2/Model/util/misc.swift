//
//  misc.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

typealias IntC = Int16
typealias FloatC = Float
typealias TickC = UInt32
typealias PATHID = UInt16
typealias TickPri = UInt8
typealias GP = GPoint

struct GPoint: CustomStringConvertible, Hashable {
	
	var x: IntC
	var y: IntC
	
	init(_ x: IntC, _ y: IntC) {
		(self.x, self.y) = (x, y)
	}
	var description: String { get { return "(\(x), \(y))"}}
	
	static func == (lhs: GPoint, rhs: GPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(x)
		hasher.combine(y)
	}
}

struct FPoint: CustomStringConvertible, Hashable {
	
	var x: FloatC
	var y: FloatC
	
	init(_ x: FloatC, _ y: FloatC) {
		(self.x, self.y) = (x, y)
	}
	var description: String { get { return "(\(x), \(y))"}}
	
	static func == (lhs: FPoint, rhs: FPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(x)
		hasher.combine(y)
	}
}

enum Direction {
	case UP
	case RIGHT
	case DOWN
	case LEFT
}

