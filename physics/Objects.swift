//
//  Mesh.swift
//  Model2
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class Mesh {
	
	let vets: [simd_float2]
	let edgs: [simd_uint2]
	var pos: simd_float2
	
	init(position: simd_float2, vertices: [simd_float2], edges: [simd_uint2]) {
		self.vets = vertices
		self.edgs = edges
		self.pos = position
	}
	
}

struct Motion {
	let mesh: Mesh
	let to: simd_float2
}
