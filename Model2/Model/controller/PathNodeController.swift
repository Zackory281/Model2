//
//  PathNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class PathNodeController: Controller {
	
	let dataBase: DataBase
	weak var shapeNodeControllerDelegate: ShapeNodeControllerDelegate?
	
	func addPathNode(_ point: GP) {
		guard pathNodeBase.getNodesAt(point.f2 + float2(0.5, 0.5)).isEmpty else {
			error("Adding a pathNode to where there's already a pathNode: ", point, ".", pathNodeBase.values.count)
			return
		}
		let pathNode = PathNode(point: point)
		pathNodeBase.add(node: pathNode)
		let fp = pathNode.fpoint
		if let right = dataBase.pathNodeBase.getNodesAt(fp + FP(1, 0)).first {
			right.table[.LEFT] = pathNode
			pathNode.table[.RIGHT] = right
		}
		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(-1, 0)).first {
			node.table[.RIGHT] = pathNode
			pathNode.table[.LEFT] = node
		}
		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(0, 1)).first {
			node.table[.DOWN] = pathNode
			pathNode.table[.UP] = node
		}
		if let node = dataBase.pathNodeBase.getNodesAt(fp + FP(0, -1)).first {
			node.table[.UP] = pathNode
			pathNode.table[.DOWN] = node
		}
		if let delegate = shapeNodeControllerDelegate {
			delegate.triggerUpdateMovement(shapeNodeBase.getNodesIn(fp + float2(-1, -1), fp + float2(1, 1)))
		}
	}
	
	init(dataBase: DataBase, shapeNodeControllerDelegate: ShapeNodeControllerDelegate) {
		self.dataBase = dataBase
		self.shapeNodeControllerDelegate = shapeNodeControllerDelegate
	}
	
	func processCommand(_ cmd: MC, time: Time) -> Bool {
		switch cmd {
		case let .addPathNode(at: point):
			/// TODO
			actionBase.addAction(InstantAction(start: time) { [unowned self] in
				self.addPathNode(point)
				return true
			})
		default:
			return false
		}
		return true
	}
	
}
