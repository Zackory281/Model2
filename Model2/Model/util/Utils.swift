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
