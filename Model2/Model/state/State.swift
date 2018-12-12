//
//  State.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

typealias StateHandler = (State)->()
class State: Hashable {
	
	let nodeStateType: NodeStateType
	var startCall: StateHandler? = nilHandler("No start call")
	var updateCall: StateHandler? = nilHandler("No updateCall call")
	var endCall: StateHandler? = nilHandler("No endCall call")
	var unsyncedCall: StateHandler? = nilHandler("No unsyncedCall call")
	var delegate: StateDelegate
	var components: [StateComponent]
	
	init(startTick: Tick, duration: Tick, nodeStateType: NodeStateType) {
		self.delegate = TimedStateDelegate(startTick: startTick, duration: duration)
		self.nodeStateType = nodeStateType
		self.components = []
	}
	
	func addComponent(_ component: StateComponent) {
		self.components.append(component)
	}
	
	func getComponent<T: StateComponent>(_ t: T.Type) -> T? {
		return components.first{return $0 is T} as? T
	}
	
	func tick(_ tick: Tick) {
		if delegate.outOfSync(tick) {
			unsyncedCall?(self)
			return
		}
		if delegate.isEndTick(tick) {
			endCall?(self)
			return
		}
		if delegate.isUpdateTick(tick) {
			updateCall?(self)
			return
		}
		startCall?(self)
	}
	
	static func == (lhs: State, rhs: State) -> Bool {
		return lhs === rhs
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(delegate))
		hasher.combine(nodeStateType)
	}
}

func nilHandler(_ message: String) -> StateHandler {
	return {_ in print(message)}
}

protocol StateDelegate: class {
	func isStartTick(_ tick: Tick) -> Bool
	func isUpdateTick(_ tick: Tick) -> Bool
	func isEndTick(_ tick: Tick) -> Bool
	func outOfSync(_ tick: Tick) -> Bool
}

class TimedStateDelegate: StateDelegate {
	
	var startingTick, progressTick, duration, endingTick: Tick
	
	init(startTick: Tick, duration: Tick) {
		self.startingTick = startTick
		self.progressTick = startingTick
		self.duration = duration
		self.endingTick = startingTick + duration
	}
	func isStartTick(_ tick: Tick) -> Bool {
		return tick == startingTick
	}
	func isUpdateTick(_ tick: Tick) -> Bool {
		return tick > startingTick && tick < endingTick
	}
	func isEndTick(_ tick: Tick) -> Bool {
		return tick == endingTick
	}
	func outOfSync(_ tick: Tick) -> Bool {
		return tick < startingTick || tick > endingTick
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(startingTick)
		hasher.combine(progressTick)
		hasher.combine(duration)
		hasher.combine(endingTick)
	}
	static func == (lhs: TimedStateDelegate, rhs: TimedStateDelegate) -> Bool {
		return lhs === rhs
	}
}

class MovementStateComponent: StateComponent {
	
}

enum StateAttributes {
	case start
	case end
}

enum NodeStateType {
	case idle
	case moving
}

class StateComponent {
	
}
