//
//  DataReader.swift
//  Model2
//
//  Created by Zackory Cramer on 12/11/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class DataReader {
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	
	init(pathBase: PathNodeBase, shapeBase: ShapeNodeBase) {
		self.pathNodeBase = pathBase
		self.shapeNodeBase = shapeBase
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
}
