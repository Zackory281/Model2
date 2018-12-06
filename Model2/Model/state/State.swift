//
//  State.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class NodeState: Hashable {
	
	var startingTick, progressTick, duration: Tick
	weak var subject: NSObject?
	let nodeStateType: NodeStateType
	
	init(startTick: Tick, duration: Tick, nodeStateType: NodeStateType, subject: NSObject) {
		self.startingTick = startTick
		self.duration = duration
		self.progressTick = 0
		self.nodeStateType = nodeStateType
		self.subject = subject
	}
	
	func unfinished() -> Bool {
		return progressTick <= duration
	}
	
	func delay(_ delay: Tick) {
		duration += delay
	}
	
	static func == (lhs: NodeState, rhs: NodeState) -> Bool {
		return lhs === rhs
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(duration)
		hasher.combine(progressTick)
		hasher.combine(startingTick)
		hasher.combine(nodeStateType)
		if let object = subject {
			hasher.combine(object)
		}
	}
}

enum NodeStateType {
	case idle
	case moving
}
