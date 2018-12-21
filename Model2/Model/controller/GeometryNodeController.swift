//
//  GeometryController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class GeometryNodeController: Controller {
	
	let dataBase: DataBase
	
	init(dataBase: DataBase) {
		self.dataBase = dataBase
	}
	
	func addGeometry(_ type: GeometryType, dir: Direction, at point: GP) {
		let geometryNode = GeometryNode(pos: point, type: type, direction: dir)
		geometryNodeBase.add(node: geometryNode)
	}
	
	func processCommand(_ cmd: MC, time: Time) -> Bool {
		switch cmd {
		case let MC.addGeoemtryNode(type: geoType, dir: direction, at: point):
			/// TODO
			actionBase.addAction(InstantAction(start: time) { [unowned self] in
				self.addGeometry(geoType, dir: direction, at: point)
				return true
			})
		default:
			return false
		}
		return true
	}
}
