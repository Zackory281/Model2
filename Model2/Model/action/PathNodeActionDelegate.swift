//
//  PathNodeActionDelegate.swift
//  Model2
//
//  Created by Zackory Cramer on 12/16/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class PathNodeActionDelegate: ActionDelegate {
	
//	func addPathNode(at point: GP) {
//		guard pathNodeBase.getNodesAt(point.f2).isEmpty else {
//			error("add a pathNode on top of another.")
//			return
//		}
//		let pathNode = PathNode(point: point)
//		pathNodeBase.add(node: pathNode)
//		let fp = point.f2
//		if let right = dataBase.pathNodeBase.getNodesAt(fp + FP(1, 0)).first {
//			right.table[.LEFT] = pathNode
//			pathNode.table[.RIGHT] = right
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(-1, 0)).first {
//			node.table[.RIGHT] = pathNode
//			pathNode.table[.LEFT] = node
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(0, 1)).first {
//			node.table[.DOWN] = pathNode
//			pathNode.table[.UP] = node
//		}
//		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(0, -1)).first {
//			node.table[.UP] = pathNode
//			pathNode.table[.DOWN] = node
//		}
//		for shapeNode in shapeNodeBase.getNodesIn(fp + float2(-1, -1), fp + float2(1, 1)) {
//			actionCreater.actionDelegateSet.shapeNodeActionDelegate.update(shapeNode)
//		}
//	}
}
