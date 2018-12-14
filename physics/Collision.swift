//
//  Collision.swift
//  Model2
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

//func collide(src: Motion, tar: Mesh) -> float_t {
//	var t: float_t = 2.0
//	for pt in src.mesh.vets {
//		//let t = collideTime(<#T##x1: float_t##float_t#>, <#T##y1: float_t##float_t#>, <#T##x2: float_t##float_t#>, <#T##y2: float_t##float_t#>, <#T##x3: float_t##float_t#>, <#T##y3: float_t##float_t#>, <#T##x4: float_t##float_t#>, <#T##y4: float_t##float_t#>)
//	}
//	return 0.0
//}

func isDisjoint(_ ma: Fixture, mb: Fixture) -> Bool {
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
		let v1 = vet - mb.vets[edg.0] - mb.pos
		let v2 = mb.vets[edg.1] - mb.vets[edg.0]
		let d = float2x2(v1 , v2).determinant
		print(v1, v2)
		if d < 0 {
			return false
		}
//		let dot = v1.x * v2.x + v1.y * v2.y
//		let dots = v2.x * v2.x + v2.y * v2.y
//		if d == 0 && dot >= 0 && dot <= dots {
//			return false
//		}
	}
	return true
}
