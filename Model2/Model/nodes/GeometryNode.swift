//
//  GeometryNode.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

typealias Transformation = float2x2

class GeometryNode: NSObject, Positionable {
	
	var fpoint: FPoint {get{return fixture.pos}set{fixture.pos = newValue}}
	var gpoint: GPoint {get{return fpoint.i2}set{fpoint = newValue.f2}}
	var fixture: Fixture
	
	init(pos: GP, type: GeometryType, direction: Direction? = nil) {
		var mesh = GEOMETRYTYPE_TO_MESH[type]!
		if let dir = direction, dir != .UP, let trans = DIRECTION_TO_ROTATION[dir] {
			mesh.transformation = trans
			mesh.compute()
		}
		self.fixture = Fixture(mesh: mesh, pos: pos.f2)
	}

}

let DIRECTION_TO_ROTATION: [Direction:Transformation] = [
	.UP : .identity,
	.RIGHT : .rotate_right,
	.DOWN : .rotate_right_twice,
	.LEFT : .rotate_left,
]

enum GeometryType {
	case Square
	case Gem
	case Triangle
	case Triangle_Small
	case Z
}

let GEOMETRYTYPE_TO_MESH: [GeometryType:Mesh] = [
	GeometryType.Square : Mesh([-2.875, -2.875, 2.875, -2.875, 2.875, 2.875, -2.875, 2.875, ]),
	GeometryType.Gem : Mesh([0, 3.823223305, -1.875, 1.948223305, -1.875, -1.948223305, 0, -3.823223305, 1.875, -1.948223305, 1.875, 1.948223305]),
	.Triangle : Mesh([-1.875, 1.875, -1.875, -3.698223305, 3.698223305, 1.875]),
	.Triangle_Small : Mesh([-0.875, 0.875, -0.875, -0.698223305, 0.698223305, 0.875]),
	.Z : Mesh([-0.875, 0.875, -2.875, 0.875, -2.875, -2.875, 0.875, -2.875, 0.875, -0.875, 2.875, -0.875, 2.875, 2.875, -0.875, 2.875]),
]
