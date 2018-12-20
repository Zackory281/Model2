//
//  Fixture.swift
//  Model2
//
//  Created by Zackory Cramer on 12/6/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class Fixture: NSObject {
	
	let mesh: Mesh
	var pos: float2
	var vets: [float2] { return mesh.vets}
	var edgs: [(Int, Int)] { return mesh.edgs}
	
	init(_ vets: [float2], _ edgs: [(Int, Int)], _ pos: float2, transformation: Transformation?=nil) {
		self.mesh = Mesh(vets, edgs, transformation)
		self.pos = pos
	}
	
	init(mesh: Mesh, pos: float2) {
		self.mesh = mesh
		self.pos = pos
	}
	
}

struct PointMotion {
	
	let v1: float2
	let v2: float2
	
	func getPos(at time: float_t) -> float2 {
		return v1 + time * (v2 - v1)
	}
	
}

struct Mesh {
	
	var vets: [float2]
	let edgs: [(Int, Int)]
	var min: float2
	var max: float2
	var transformation: matrix_float2x2?
	
	init(_ vets: [float2], _ edgs: [(Int, Int)]? = nil, _ transform: matrix_float2x2? = nil) {
		self.vets = vets
		if let e = edgs {
			self.edgs = e
		} else {
			var e = [(Int, Int)].init(repeating: (0, 1), count: vets.count)
			for i in 1...vets.count-1 {
				e[i] = (i, i + 1)
			}
			e[vets.count - 1] = (vets.count - 1, 0)
			self.edgs = e
		}
		var minn = vets[0]
		var maxx = vets[0]
		for vet in vets {
			minn = simd.min(minn, vet)
			maxx = simd.max(maxx, vet)
		}
		self.min = minn
		self.max = maxx
		self.transformation = transform
		compute()
	}
	
	mutating func compute() {
		if let mat = transformation {
			for i in 0...vets.count - 1 {
				self.vets[i] = matrix_multiply(mat, self.vets[i])
			}
			self.max = matrix_multiply(mat, max)
			self.min = matrix_multiply(mat, min)
		}
	}
	
	init(_ vetss: [Float], _ edgss: [Int]?=nil, _ transform: matrix_float2x2? = nil) {
		var v: [float2] = []
		for i in stride(from: 0, to: vetss.count - 1, by: 2) {
			v.append(float2(vetss[i], vetss[i+1]))
		}
		if let edgss = edgss {
			var e: [(Int, Int)] = []
			for i in stride(from: 0, to: edgss.count - 1, by: 2) {
				e.append((edgss[i], edgss[i+1]))
			}
			self.init(v, e, transform)
		} else {
			self.init(v, nil, transform)
		}
	}
}
