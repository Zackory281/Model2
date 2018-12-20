//
//  Collision.swift
//  Model2
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

func isFixtureDisjoint(_ ma: Fixture, mb: Fixture) -> Bool {
	for mav in ma.vets {
		if isOrientedInside(mav + ma.pos, mb: mb) {
			return false
		}
	}
	for mbv in mb.vets {
		if isOrientedInside(mbv + mb.pos, mb: ma) {
			return false
		}
	}
	return true
}

func isOrientedInside(_ vet: float2, mb: Fixture) -> Bool {
	for edg in mb.edgs {
		let v2 = vet - mb.vets[edg.0] - mb.pos
		let v1 = mb.vets[edg.1] - mb.vets[edg.0]
		let d = float2x2(v1 , v2).determinant
		if d < 0 {
			return false
		}
	}
	return true
}
