//
//  ActionController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/14/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ActionEvaluator {
	
	let reaper: Reaper
	let actionCreater: ActionCreater
	
	var actionBase: ActionBase { return reaper.actionBase }
	var dataBase: DataReader { return reaper.dataBase }
	var clock: Clock { return reaper.clock}
	
	private var inFrameAction: [Action] = []
	private let pathNodeEvaluator: PathNodeEvaluator
	private let shapeNodeEvaluator: ShapeNodeEvaluator
	
	var nd: Time = 0
	var pnd: Time = -1
	func evaluateTo(_ time: Time) {
		guard clock.evalTime <= time else {
			error("Evaluat to time in the past: ", time, " sec.")
			return
		}
		nd = actionBase.nextDate
		if nd != pnd {
			print("Next eval time: ", nd)
		}
		pnd = nd
		while clock.evalTime >= nd {
			guard let instantAction = actionBase.popNextInstantAction() else {
				error("Next action in frame but not existant.")
				break
			}
			nd = actionBase.nextDate
			guard let act = instantAction.action else {
				error("Instant Action has no action: ", instantAction)
				continue
			}
			clock.evalTime = instantAction.startTime
			act(instantAction)
		}
		clock.evalTime = time
		for contAction in actionBase.actionsIterateReturned(to: time) {
			contAction.collapse?(time)
		}
	}
	
	init(reaper: Reaper, actionCreater: ActionCreater) {
		self.reaper = reaper
		self.actionCreater = actionCreater
		self.pathNodeEvaluator = PathNodeEvaluator(reaper: reaper, actionCreater: actionCreater)
		self.shapeNodeEvaluator = ShapeNodeEvaluator(actionCreater: actionCreater, reaper: reaper)
	}
}
