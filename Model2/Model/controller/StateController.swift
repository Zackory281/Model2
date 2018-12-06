//
//  StateController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class StateController: Tickable {
	
	// Tickable stubs
	func tick(_ tick: Tick) -> Bool {
		initTick(tick)
		updateTick()
		return true
	}
	
	let priority: TickPri = STATE_CONTROLLER_PRIORITY
	
	
	var reaper: Reaper
	var tick: Tick
	var shapeNodeStateController: StateControllerDelegate
	
	init(reaper: Reaper) {
		self.tick = 0
		self.reaper = reaper
		self.shapeNodeStateController = ShapeNodeStateController(reaper: reaper)
	}
	
	func initTick(_ tick: Tick) {
		self.tick = tick
		shapeNodeStateController.initTick(tick: tick)
	}
	
	func updateTick() {
		shapeNodeStateController.updateTick()
	}
}

protocol StateControllerDelegate {
	var tick: Tick {set get}
	var reaper: Reaper {set get}
	func initTick(tick: Tick)
	func updateTick()
}
