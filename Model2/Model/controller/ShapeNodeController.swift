//
//  ShapeNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ShapeNodeController: Controller {
	
	let dataBase: DataBase
	
	func addShapeNode(_ point: GP) {
		guard shapeNodeBase.getNodesAt(point).isEmpty else {
			error("Add nodes at where there are already nodes.")
			return
		}
		guard let pathNode = pathNodeBase.getNodesAt(point).first else {
			error("No pathnode to add new shapenode on.")
			return
		}
		let shapeNode = ShapeNode(pathNode: pathNode)
		shapeNodeBase.add(node: shapeNode)
		pathNode.taken = true
	}
	
	func update(_ shapeNode: ShapeNode) {
		
	}
	
	init(dataBase: DataBase) {
		self.dataBase = dataBase
	}
	
	func processCommand(_ cmd: MC, time: Time) -> Bool {
		switch cmd {
		case let .addShapeNode(at: point):
			/// TODO
			actionBase.addAction(InstantAction(start: time) { [unowned self] in
				self.addShapeNode(point)
			})
		default:
			return false
		}
		return true
	}
	
}
