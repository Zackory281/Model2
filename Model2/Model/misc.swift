//
//  misc.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

typealias IntC = Int16

struct Point {
	var x: IntC
	var y: IntC
	init(_ x: IntC, _ y: IntC) {
		(self.x, self.y) = (x, y)
	}
}

enum Direction {
	case UP
	case RIGHT
	case DOWN
	case LEFT
}
