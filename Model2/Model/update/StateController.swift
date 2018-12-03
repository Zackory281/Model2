//
//  StateController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class StateController {
	
	var reaper: Reaper
	
	init(reaper: Reaper) {
		self.reaper = reaper
	}
	
	func updateStates(_ tick: Tick) {
		for statable in reaper.statables {
			for state in statable.states {
				if state.progressTick == tick {
					reaper.instantStatable.addFirst(<#T##value: Statable##Statable#>)
				}
			}
		}
	}
}
