//
//  Fixture.swift
//  Model2
//
//  Created by Zackory Cramer on 12/6/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class Fixture {
	
	let vets: [float2]
	let edgs: [int2]
	
	init(_ vets: [float2], _ pts: [int2]) {
		self.vets = vets
		self.pts = pts
	}
}

struct Motion {
	let fixture: Fixture
	let start: float2
	let end: float2
}
