//
//  ShapeNodeStateUpdater.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ShapeNodeStateHandler {
	
	// StateControllerDelegate stubs
	var tick: Tick
	var reaper: Reaper
	var stateBase: StateBase { get { return reaper.stateBase } }
	
	func initTick(tick: Tick) {
		self.tick = tick
	}
	
	func moveShape(_ shapeNode: ShapeNode, _ direction: Direction?) {
		let shapeMoveState = NodeState(startTick: tick, duration: 500, nodeStateType: .moving, subject: shapeNode)
		shapeMoveState.attributes[.start] = shapeNode.fpoint
		shapeMoveState.attributes[.end] =  shapeNode.fpoint + DirectionToVector[direction ?? shapeNode.direction]!
		stateBase.addState(shapeMoveState)
	}
	
	func handleShapeIdle(_ state: State) {
		print("ShapeNode Idling")
	}
	
	func handleShapeMoveStart(_ state: State) {
		print("ShapeNode Idling")
	}
	
//	func handleIdle(_ state: State) {
//		let state = state as! NodeState
//		guard let subject = state.subject as? ShapeNode, state.progressTick == tick else { return }
//		if tick == state.endingTick {
//			print(subject, " idle finishes")
//			moveShape(subject, nil)
//		} else {
//			print(subject, " idleing ")
//			stateBase.addStateUpdated(state)
//		}
//		state.progressTick = tick + 1
//	}
//
//	func handleMove(_ state: State) {
//		let state = state as! NodeState
//		guard let subject = state.subject as? ShapeNode, state.progressTick == tick else { return }
//		if state.isFinishingTick(tick) {
//			subject.fpoint = state.attributes[.end]! as! float2
//			print(subject, " finishes moving to ", subject.fpoint)
//			moveShape(subject, .DOWN)
//		} else {
//			let start = state.attributes[.start]! as! float2
//			let end = state.attributes[.end]! as! float2
//			//print(end, "ha", Float(tick - state.startingTick) / Float(state.duration))
//			subject.fpoint = start + Float(tick - state.startingTick).squareRoot() / Float(state.duration).squareRoot() * (end - start)
//			//print(subject, " moves to ", subject.fpoint)
//			stateBase.addStateUpdated(state)
//		}
//		state.progressTick = tick + 1
//		reaper.shapeNodeBase.move(node: subject)
//	}
//
//	func updateTick() {
//		while let state = reaper.stateBase.stateBuffer.popFirst() {
//			guard state.progressTick == tick else {
//				error("State out of sync, removing.")
//				continue
//			}
//			guard let handler = stateHandler[state.nodeStateType] else {
//				error("No handler for ", state.nodeStateType)
//				continue
//			}
//			handler(state)
//		}
//	}
	
	init(reaper: Reaper) {
		self.reaper = reaper
		self.tick = 0
	}
}
