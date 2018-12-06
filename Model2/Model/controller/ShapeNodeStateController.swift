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
	
	func updateTick() {
		for state in reaper.stateBase.states {
			guard state.unfinished() else {
				reaper.addStatesToRemove(state)
				continue
			}
			guard let subject = state.subject else { continue }
			switch state.nodeStateType {
			case .idle:
				state.duration = tick - state.startingTick
				print(subject, " performing ", state.nodeStateType)
			default:
				break
			}
			if !state.unfinished() {
				reaper.addStatesToRemove(state)
			}
		}
	}
	
	init(reaper: Reaper) {
		self.reaper = reaper
		self.tick = 0
	}
}
