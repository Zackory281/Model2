//
//  PathNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/1/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class NodeController: Tickable {
	
	func tick(_ tick: Tick) -> Bool {
		return false
	}
	
	var priority: TickPri = 1
	
}
