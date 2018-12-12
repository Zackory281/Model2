//
//  State.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class State: Hashable {
	
	var startingTick, progressTick, duration, endingTick: Tick
	let nodeStateType: NodeStateType
	
	init(startTick: Tick, duration: Tick, nodeStateType: NodeStateType) {
		self.startingTick = startTick
		self.duration = duration
		self.endingTick = startingTick + duration
		self.progressTick = startTick
		self.nodeStateType = nodeStateType
	}
	
	func unfinished() -> Bool {
		return progressTick <= endingTick
	}
	
	func isFinishingTick(_ tick: Tick) -> Bool {
		return tick == endingTick
	}
	
	func delay(_ delay: Tick) {
		duration += delay
	}
	
	static func == (lhs: State, rhs: State) -> Bool {
		return lhs === rhs
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(duration)
		hasher.combine(progressTick)
		hasher.combine(startingTick)
		hasher.combine(nodeStateType)
	}
}

class NodeState: State {
	
	weak var subject: NSObject?
	var attributes: [StateAttributes : Any]
	
	init(startTick: Tick, duration: Tick, nodeStateType: NodeStateType, subject: NSObject) {
		self.attributes = [:]
		super.init(startTick: startTick, duration: duration, nodeStateType: nodeStateType)
		self.subject = subject
	}
	
	override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		if let sub = subject {
			hasher.combine(sub)
		}
	}
}

enum StateAttributes {
	case start
	case end
}

enum NodeStateType {
	case idle
	case moving
}
