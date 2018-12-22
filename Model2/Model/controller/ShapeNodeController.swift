//
//  ShapeNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ShapeNodeController: Controller, ShapeNodeControllerDelegate {
	
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
		update(shapeNode)
	}
	
	func triggerUpdateMovement(_ shapeNodes: [ShapeNode]) {
		for shapeNode in shapeNodes {
			triggerUpdateMovement(shapeNode: shapeNode)
		}
	}
	
	func triggerUpdateMovement(shapeNode: ShapeNode) {
		if !shapeNode.moving, let pathNode = shapeNode.pathNode {
			let fp = shapeNode.fpoint
			let dir = shapeNode.direction
			//let movement = ShapeMovement.init(startTime: evalTime, duration: 1000, startPoint: shapeNode.fpoint, delta: FP()
			var ddir: Direction?
			var delta: FP?
			if let path = pathNode.table[dir], !path.taken {
				delta = DirectionToVector[dir]!
				ddir = dir
			} else if let path = pathNode.table[dir.left()], !path.taken {
				ddir = dir.left()
				delta = DirectionToVector[ddir!]!
			} else if let path = pathNode.table[dir.right()], !path.taken {
				ddir = dir.right()
				delta = DirectionToVector[ddir!]!
			}
			if let d = ddir {
				let movement = ShapeMovement.init(startTime: evalTime, duration: MOVING_DURATION, startPoint: fp, delta: delta!)
				shapeNode.direction = d
				shapeNode.movement = movement
				let caction = ContinuousAction(start: evalTime, duration: MOVING_DURATION, actionType: .DontCare)
				shapeNode.moving = true
				if let pathnode = shapeNode.pathNode {
					pathnode.taken = false
				}
				caction.collapse = {[weak shapeNode, unowned self] in
					guard let shapeNode = shapeNode else {
						return false
					}
					self.updateShapeMovement(shapeNode)
					return true
				}
				let iaction = InstantAction(start: evalTime + MOVING_DURATION, action: {[weak shapeNode] in
					guard let shapeNode = shapeNode else {
						return false
					}
					self.finishShapeMovement(shapeNode)
					return true
				})
				actionBase.addAction(iaction)
				actionBase.addAction(caction)
			}
		}
	}
	
	func update(_ shapeNode: ShapeNode) {
		triggerUpdateMovement(shapeNode: shapeNode)
	}
	
	func updateShapeMovement(_ shapeNode: ShapeNode) {
		guard let movement = shapeNode.movement else {
			return
		}
		shapeNode.fpoint = movement.startPoint + movement.delta * Float((evalTime - movement.startTime) / movement.duration)
		shapeNodeBase.move(node: shapeNode)
	}
	
	func finishShapeMovement(_ shapeNode: ShapeNode) {
		guard let movement = shapeNode.movement else {
			return
		}
		shapeNode.fpoint = movement.startPoint + movement.delta
		shapeNode.movement = nil
		if let pathNode = pathNodeBase.getNodesAt(shapeNode.fpoint).first {
			shapeNode.pathNode = pathNode
			pathNode.taken = true
		}
		shapeNode.moving = false
		shapeNodeBase.move(node: shapeNode)
		update(shapeNode)
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
				return true
			})
		default:
			return false
		}
		return true
	}
	
}

protocol ShapeNodeControllerDelegate: AnyObject {
	func triggerUpdateMovement(_ shapeNodes: [ShapeNode])
}

let MOVING_DURATION: Time = 2
