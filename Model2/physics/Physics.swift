//
//  Physics.swift
//  Model2
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

func collideTime(_ x1: float_t, _ y1: float_t, _ x2: float_t, _ y2: float_t,
	   _ x3: float_t,  _ y3: float_t,  _ x4: float_t,  _ y4: float_t) -> float_t{
	let det = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
	if det == 0 {
		return Float.infinity
	}
	return ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / det
}

func collideTime(_ vec: float2x2, _ line: float2x2) -> float_t {
	return collideTime(p1: vec.columns.0, p2: vec.columns.1, p3: line.columns.0, p4: line.columns.1)
}

func orientedCollidable(_ x1: float_t, _ y1: float_t, _ x2: float_t, _ y2: float_t,
						 _ x3: float_t,  _ y3: float_t,  _ x4: float_t,  _ y4: float_t) -> Bool{
	let m: float2x2 = float2x2(float2(x2, y2) - float2(x1, y1), float2(x4, y4) - float2(x3, y3))
	return simd_determinant(m) < 0
}

func collideTime(p1: simd_float2, p2: simd_float2, p3: simd_float2, p4: simd_float2) -> float_t {
	return collideTime(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y)
}

func collideTime(motion: Motion, pt: float2) -> float_t {
	var time: float_t = 2
	for e in motion.fixture.edgs {
		time = min()
	}
}
