//
//  ActionBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/14/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ActionBase {
	
	private var continuousActions: [ContinuousAction]
	private var instantActions: Heap<InstantAction>
	var sorted: Bool = true
	var nextDate: Time { return instantActions.peek()?.startTime ?? Double.infinity}
	
	func popNextInstantAction() -> InstantAction? {
		let ele = instantActions.remove()
		return ele
	}
	
	func actionsIterate(_ function: (Action) -> Void, to date: Time) {
		if !sorted {
			continuousActions = continuousActions.stableSorted(by: actionComparator)
			sorted = true
		}
		for action in continuousActions {
			guard action.startTime < date else {
				break
			}
			function(action)
		}
	}
	
	func actionsIterateReturned(to date: Time) -> [ContinuousAction] {
		if !sorted {
			continuousActions = continuousActions.stableSorted(by: actionComparator)
			sorted = true
		}
		shaveActionUp(to: date)
		var array = [ContinuousAction]()
		for action in continuousActions {
			guard action.startTime < date else {
				return array
			}
			array.append(action)
		}
		return array
	}
	
	func shaveActionUp(to time: Time) {
		if !sorted {
			continuousActions = continuousActions.stableSorted(by: actionComparator)
			sorted = true
		}
		while let first = continuousActions.first, first.endTime <= time {
			continuousActions.remove(at: 0)
		}
	}
	
	func addAction(_ action: Action) {
		if let cont = action as? ContinuousAction {
			addContinuousAction(cont)
		} else if let cont = action as? InstantAction {
			addInstantAction(cont)
		} else {
			error("Weird action: ", action)
		}
	}
	
	func addContinuousAction(_ instantAction: ContinuousAction) {
		continuousActions.append(instantAction)
	}
	
	func addInstantAction(_ continuousAction: InstantAction) {
		instantActions.insert(continuousAction)
	}
	
	init() {
		self.continuousActions = [ContinuousAction]()
		self.instantActions = Heap<InstantAction>.init(sort: actionComparator)
	}
}
