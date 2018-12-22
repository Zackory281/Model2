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
	let projectileBase: ProjectileBase
	let actionBase: ActionBase
	let clock: Clock
	let imagineData: ImagineData
	
	init(pathBase: PathNodeBase, shapeBase: ShapeNodeBase, geometryBase: GeometryNodeBase, projectileBase: ProjectileBase, actionBase: ActionBase, clock: Clock) {
		self.pathNodeBase = pathBase
		self.shapeNodeBase = shapeBase
		self.geometryNodeBase = geometryBase
		self.projectileBase = projectileBase
		self.actionBase = actionBase
		self.clock = clock
		self.imagineData = ImagineData()
	}
	
	func removeNode(function: (NSObject) -> ()) {
		for obj in pathNodeBase.flushRemove() {
			function(obj)
		}
		for obj in shapeNodeBase.flushRemove() {
			function(obj)
		}
		for obj in geometryNodeBase.flushRemove() {
			function(obj)
		}
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
	
	func forEachProjectileNode(function: (ProjectileNode)->()) {
		for projectile in projectileBase.values {
			function(projectile)
		}
	}
	
	var imagePathNode: PathNode?
	var preImaginePathNode: PathNode?
}
