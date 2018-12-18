//
//  Action.swift
//  Model2
//
//  Created by Zackory Cramer on 12/14/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

typealias ActionHandler = (Action) -> ()
typealias CAHandler = (Time) -> ()

import simd
import Foundation

class Action: Equatable {
	
	let startTime: Time
	let actionType: ActionType
	var components: [ActionComponent]
	let actionId: Int
	
	init(start: Time, actionType: ActionType) {
		self.actionType = actionType
		self.startTime = start
		self.components = []
		self.actionId = getActionId()
	}
	
	func addComponent(_ component: ActionComponent) {
		self.components.append(component)
	}
	
	func getComponent<T: ActionComponent>(of type: T.Type) -> T? {
		return components.first(where: {$0 is T}) as? T
	}
	
	static func == (lhs: Action, rhs: Action) -> Bool {
		return lhs === rhs
	}
}

enum ActionType {
	case AddPathNode
	case AddShapeNode
	case MoveShapeNode
	case DontCare
}

class InstantAction: Action {
	
	var action: ActionHandler?
	
//	init(start: Time, actionType: ActionType) {
//		self.action = action
//		super.init(start: start, actionType: actionType)
//	}
	
}

class ContinuousAction: Action {
	
	let duration: Time
	let endTime: Time
	var updateAction: ActionHandler?
	var endAction: ActionHandler?
	var collapse: CAHandler?
	
	init(start: Time, end: Time, actionType: ActionType) {
		self.endTime = end
		self.duration = end - start
		super.init(start: start, actionType: actionType)
	}
	
	init(start: Time, duration: Time, actionType: ActionType) {
		self.duration = duration
		self.endTime = start + duration
		super.init(start: start, actionType: actionType)
	}
}

class ActionComponent {
	
}

class ActionComponentGP: ActionComponent {
	var gpoint: GPoint
	init(gp: GPoint) {
		self.gpoint = gp
	}
}

class ActionComponentMove: ActionComponent {
	weak var shapeNode: ShapeNode?
	let start, delta: FPoint
	let startTime, period: Time
	init(shapeNode: ShapeNode, from: FPoint, to: FPoint, startTime: Time, period: Time) {
		self.start = from
		self.delta = to - from
		self.startTime = startTime
		self.period = period
		self.shapeNode = shapeNode
	}
}
let actionComparator: (Action, Action) -> Bool = {(r, l) in
	if r.startTime < l.startTime {
		return true
	} else if r.startTime > l.startTime {
		return false
	}
	return r.actionId < l.actionId
}

let nilHander: ActionHandler = {(action) in error("Nil handler")}

func stringHandler(_ string: String) -> ActionHandler {
	return {(action) in print(string)}
}
