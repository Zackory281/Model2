//
//  State.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd
import AppKit

typealias StateHandler = (State)->()
class State: Hashable {
	
	let nodeStateType: NodeStateType
	var startCall: StateHandler? = nilHandler("No start call")
	var updateCall: StateHandler? = nilHandler("No updateCall call")
	var endCall: StateHandler? = nilHandler("No endCall call")
	var unsyncedCall: StateHandler? = nilHandler("No unsyncedCall call")
	var delegate: StateDelegate
	private var components: [StateComponent]
	
	init(startTick: Tick, duration: Tick, nodeStateType: NodeStateType) {
		self.delegate = TimedStateDelegate(startTick: startTick, duration: duration)
		self.nodeStateType = nodeStateType
		self.components = []
	}
	
	func addComponent(_ component: StateComponent) {
		component.state = self
		self.components.append(component)
	}
	
	func getComponent<T: StateComponent>(_ t: T.Type) -> T? {
		return components.first{return $0 is T} as? T
	}
	
	func tick(_ tick: Tick) -> Bool {
		defer {
			delegate.ticked(tick)
		}
		if delegate.outOfSync(tick) {
			unsyncedCall?(self)
			return true
		}
		if delegate.isEndTick(tick) {
			endCall?(self)
			return true
		}
		if delegate.isUpdateTick(tick) {
			updateCall?(self)
			return false
		}
		startCall?(self)
		return false
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
	func ticked(_ tick: Tick)
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
		return progressTick == startingTick && tick == startingTick
	}
	func isUpdateTick(_ tick: Tick) -> Bool {
		return tick > startingTick && tick < endingTick && progressTick >= tick && progressTick < endingTick
	}
	func isEndTick(_ tick: Tick) -> Bool {
		return tick == endingTick && progressTick == endingTick
	}
	func outOfSync(_ tick: Tick) -> Bool {
		return tick < startingTick || tick > endingTick || tick < progressTick
	}
	func getProgress() -> Float {
		return quadraticEaseInOut(Float(progressTick - startingTick) / Float(duration))
	}
	func ticked(_ tick: Tick) {
		progressTick = tick + 1
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
private func quadraticEaseInOut <T: FloatingPoint> (_ x: T) -> T {
	if x < 1 / 2 {
		return 2 * x * x
	} else {
		return (-2 * x * x) + (4 * x) - 1
	}
}
class MovementStateComponent: StateComponent {
	var startingPosition: FPoint
	var endingPosition: FPoint
	var startingTick: Tick
	weak var shapeNode: ShapeNode?
	
	init(start: FPoint, end: FPoint, startTick: Tick, shapeNode: ShapeNode) {
		self.startingPosition = start
		self.endingPosition = end
		self.startingTick = startTick
		self.shapeNode = shapeNode
	}
	
	func getProgressedPoint(_ progress: Float) -> FPoint{
		return startingPosition + progress * (endingPosition - startingPosition)
	}
}

class SubjectStateComponent: StateComponent {
	weak var subject: NSObject?
	init(_ subject: NSObject) {
		self.subject = subject
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

class StateComponent {
	weak var state: State?
}
