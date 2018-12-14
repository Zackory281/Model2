//
//  StateController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class StateController: Tickable {
	
	// Tickable stubs
	func tick(_ tick: Tick) -> Bool {
		initTick(tick)
		updateTick()
		return true
	}
	
	let priority: TickPri = STATE_CONTROLLER_PRIORITY
	
	func make(node: ShapeNode, move dir: Direction = .UP) {
		let state = State(startTick: tick, duration: 45, nodeStateType: .moving)
		state.addComponent(MovementStateComponent(start: node.fpoint, end: node.fpoint + DirectionToVector[dir]!, startTick: tick, shapeNode: node))
		state.startCall = shapeNodeStateController.handleShapeMoveStart
		state.updateCall = shapeNodeStateController.handleShapeMoveUpdate
		state.endCall = shapeNodeStateController.handleShapeMoveEnd
		reaper.stateBase.addState(state)
	}
	
	var reaper: Reaper
	var tick: Tick
	var shapeNodeStateController: ShapeNodeStateHandler
	
	init(reaper: Reaper) {
		self.tick = 0
		self.reaper = reaper
		self.shapeNodeStateController = ShapeNodeStateHandler(reaper: reaper)
	}
	
	func initTick(_ tick: Tick) {
		self.tick = tick
		shapeNodeStateController.initTick(tick: tick)
	}
	
	func updateTick() {
		//shapeNodeStateController.reaper.stateBase.dumpStates()
		while let state = reaper.stateBase.stateBuffer.popFirst() {
			if !state.tick(tick) {
				reaper.stateBase.addStateUpdated(state)
			}
		}
		reaper.stateBase.dumpStates()
	}
}
