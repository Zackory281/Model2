//
//  DataReader.swift
//  Model2
//
//  Created by Zackory Cramer on 12/11/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class DataBase {
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	let geometryNodeBase: GeometryNodeBase
	let actionBase: ActionBase
	let clock: Clock
	
	init(pathBase: PathNodeBase, shapeBase: ShapeNodeBase, geometryBase: GeometryNodeBase, actionBase: ActionBase, clock: Clock) {
		self.pathNodeBase = pathBase
		self.shapeNodeBase = shapeBase
		self.geometryNodeBase = geometryBase
		self.actionBase = actionBase
		self.clock = clock
	}
	
	func forEachShapeNode(function: (ShapeNode)->()) {
		for shapeNode in shapeNodeBase.values {
			function(shapeNode)
		}
	}
	
	func forEachPathNode(function: (PathNode)->()) {
		for pathNode in pathNodeBase.values {
			function(pathNode)
		}
	}
	
	func forEachGeometryNode(function: (GeometryNode)->()) {
		for geometryNode in geometryNodeBase.values {
			function(geometryNode)
		}
	}
}
