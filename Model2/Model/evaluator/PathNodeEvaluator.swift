//
//  PathNodeEvaluator.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class PathNodeEvaluator {
	
	let reaper: Reaper
	var dataBase: DataReader { return reaper.dataBase }
	let actionCreater: ActionCreater
	
//	func addPathNode(at point: GP) {
//		guard dataBase.pathNodeBase.getNodesAt(point.f2).isEmpty else {
//			error("add a pathNode on top of another.")
//			return
//		}
//		let pathNode = PathNode(point: point)
//		dataBase.pathNodeBase.add(node: pathNode)
//		if let right = dataBase.pathNodeBase.getNodesAt(point.f2 + FP(1, 0)).first {
//			right.table[.LEFT] = pathNode
//			pathNode.table[.RIGHT] = right
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(point.f2 + FP(-1, 0)).first {
//			node.table[.RIGHT] = pathNode
//			pathNode.table[.LEFT] = node
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(point.f2 + FP(0, 1)).first {
//			node.table[.DOWN] = pathNode
//			pathNode.table[.UP] = node
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(point.f2 + FP(0, -1)).first {
//			node.table[.UP] = pathNode
//			pathNode.table[.DOWN] = node
//		}
////		if let shapeNode = dataBase.shapeNodeBase.getNodesAt(point.f2).first, !shapeNode.moving {
////			if let _ = pathNode.table[shapeNode.direction.right()] {
////				actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction.right())
////			} else if let _ = pathNode.table[shapeNode.direction.left()] {
////				actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction.left())
////			} else if let _ = pathNode.table[shapeNode.direction] {
////				actionCreater.addMoveShapeNodeAction(shapeNode: shapeNode, direction: shapeNode.direction)
////			}
////		}
//	}
//	
//	func shapeNodeMovingUpdate(_ action: Action) {
//		guard let moveComp = action.getComponent(of: ActionComponentMove.self) else { return }
//		guard let shapeNode = moveComp.shapeNode else { return }
//		shapeNode.fpoint = moveComp.start + Float((reaper.clock.evalTime - moveComp.startTime) / moveComp.period) * moveComp.delta
//		//print(shapeNode.fpoint)
//		dataBase.shapeNodeBase.move(node: shapeNode)
//	}
	
	init(reaper: Reaper, actionCreater: ActionCreater) {
		self.reaper = reaper
		self.actionCreater = actionCreater
	}
}
