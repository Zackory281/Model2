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

func orientedCollidable(_ vec1: float2x2, _ vec2: float2x2) -> Bool{
	return orientedCollidable(vec1.columns.0.x, vec1.columns.0.y, vec1.columns.1.x, vec1.columns.1.y
		, vec2.columns.0.x, vec2.columns.0.y, vec2.columns.1.x, vec2.columns.1.y)
}

func collideTime(p1: simd_float2, p2: simd_float2, p3: simd_float2, p4: simd_float2) -> float_t {
	return collideTime(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y)
}

func collideTime(motion: PointMotion, fixture: Fixture) -> float_t {
	var time: float_t = float_t.infinity
	for e in fixture.edgs {
		let edge = float2x2(fixture.vets[Int(e.x)], fixture.vets[Int(e.y)]) + float2x2(fixture.pos, fixture.pos)
		let mos = float2x2([motion.v1, motion.v2])
		if !orientedCollidable(mos, edge) {
			continue
		}
		let t = collideTime(mos, edge)
		if t >= 0 && t <= 1 {
			time = min(time, t)
		}
	}
	return time
}
