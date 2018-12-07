//
//  ShapeNodeStateUpdater.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ShapeNodeStateController: StateControllerDelegate {
	
	// StateControllerDelegate stubs
	var tick: Tick
	var reaper: Reaper
	
	func initTick(tick: Tick) {
		self.tick = tick
	}
	
	func handleIdle(_ state: State) {
		let state = state as! NodeState
		guard let subject = state.subject else { return }
		print(subject, " idles")
	}
	
	func updateTick() {
		for state in reaper.stateBase.states {
			guard state.unfinished() else {
				reaper.addStatesToRemove(state)
				continue
			}
			guard let handler = stateHandler[state.nodeStateType] else {
				error("No handler for ", state.nodeStateType)
				continue
			}
			handler(state)
			if !state.unfinished() {
				reaper.addStatesToRemove(state)
			}
		}
	}
	
	init(reaper: Reaper) {
		self.reaper = reaper
		self.tick = 0
	}
	
	lazy var stateHandler: [NodeStateType: (State) -> ()] = {
		return [
			NodeStateType.idle : self.handleIdle
		]
	}()
}
