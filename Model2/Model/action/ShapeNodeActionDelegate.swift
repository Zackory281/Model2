//
//  ShapeNodeActionDelegate.swift
//  Model2
//
//  Created by Zackory Cramer on 12/16/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ShapeNodeActionDelegate: ActionDelegate {
	
//	func addShapeNode(at point: GP) {
//		guard shapeNodeBase.getNodesAt(point.f2).isEmpty else {
//			error("can't layer shapeNodes")
//			return
//		}
//		guard let pathNode = pathNodeBase.getNodesAt(point.f2).first else {
//			error("No pathnode to add shapeNode on ", point)
//			return
//		}
//		guard !pathNode.taken else {
//			error("Pathnode is taken: ", point)
//			return
//		}
//		pathNode.taken = true
//		let shapeNode = ShapeNode(pathNode: pathNode)
//		shapeNode.gpoint = point
//		shapeNodeBase.add(node: shapeNode)
//		update(shapeNode)
//	}
//	
//	func finishedMovingShapeNode(_ shapeNode: ShapeNode, _ to: FP) {
//		guard shapeNode.moving else {
//			error("Shapenode not moving..")
//			return
//		}
//		guard let pathNode = dataBase.pathNodeBase.getNodesAt(to).first else {
//			print("Moving to a non-existing pathnode.")
//			return
//		}
//		shapeNode.fpoint = to
//		shapeNode.pathNode = pathNodeBase.getNodesAt(to).first
//		shapeNode.moving = false
//		shapeNodeBase.move(node: shapeNode)
//		update(shapeNode)
//	}
//	
//	func move(shapeNode: ShapeNode, from: FP, delta: FP, startTime: Time, duration: Time) {
//		shapeNode.fpoint = from + delta * Float((clock.evalTime - startTime) / duration)
//		shapeNodeBase.move(node: shapeNode)
//	}
//	
//	func update(_ shapeNode: ShapeNode) {
//		if !shapeNode.moving {
//			let fp = shapeNode.fpoint
//			let dir = shapeNode.direction
//			if let path = pathNodeBase.getNodesAt(fp + DirectionToVector[dir]!).first, !path.taken {
//				actionCreater.moveShapeNode(shapeNode, fp + DirectionToVector[dir]!, dir)
//			} else if let path = pathNodeBase.getNodesAt(fp + DirectionToVector[dir.left()]!).first, !path.taken {
//				actionCreater.moveShapeNode(shapeNode, fp + DirectionToVector[dir.left()]!, dir.left())
//			} else if let path = pathNodeBase.getNodesAt(fp + DirectionToVector[dir.right()]!).first, !path.taken {
//				actionCreater.moveShapeNode(shapeNode, fp + DirectionToVector[dir.right()]!, dir.right())
//			}
//		}
//	}
}
