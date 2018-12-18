//
//  ShapeNodeEvaluator.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ShapeNodeEvaluator {
	
	let reaper: Reaper
	let actionCreater: ActionCreater
	var dataBase: DataReader { return reaper.dataBase }
	
//	func updateShapeNodes() {
//		dataBase.forEachShapeNode(function: self.updateShapeNode)
//	}
//	
//	func updateShapeNode(shapeNode: ShapeNode) {
//		if !shapeNode.moving, let pathNode = shapeNode.pathNode {
//			let point = pathNode.fpoint
//			if let shapeNode = dataBase.shapeNodeBase.getNodesAt(point).first, !shapeNode.moving {
//				if let path = pathNode.table[shapeNode.direction], !path.taken {
//					actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction)
//				} else if let path = pathNode.table[shapeNode.direction.left()], !path.taken {
//					actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction.left())
//				} else if let path = pathNode.table[shapeNode.direction.right()], !path.taken {
//					actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction.right())
//				}
//			}
//		}
//	}
	
	init(actionCreater: ActionCreater, reaper: Reaper) {
		self.reaper = reaper
		self.actionCreater = actionCreater
	}
}
