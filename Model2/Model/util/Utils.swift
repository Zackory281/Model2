//
//  Utils.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

private var i: PATHID = 0

func getNodeId() -> PATHID {
	i += 1
	return i
}

private var actioni: Int = 0

func getActionId() -> Int {
	actioni += 1
	return actioni
}

func error(_ items: Any..., separator: String = "", terminator: String = "") {
	print(items, separator: separator, terminator: terminator)
}

extension float2 {
	var i2: int2 {
		return int2(Int32(x), Int32(y))
	}
}

extension int2 {
	var f2: float2 {
		return float2(Float(x), Float(y))
	}
}

extension Sequence {
	func stableSorted(
		by areInIncreasingOrder: (Element, Element) throws -> Bool)
		rethrows -> [Element]
	{
		return try enumerated()
			.sorted { a, b -> Bool in
				try areInIncreasingOrder(a.element, b.element) ||
					(a.offset < b.offset && !areInIncreasingOrder(b.element, a.element))
			}
			.map { $0.element }
	}
}
