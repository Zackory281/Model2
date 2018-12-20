//
//  ActionCreater.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ActionCreater {
	
	let clock: Clock
	let reaper: Reaper
	let actionDelegateSet: ActionDelegateSet
	
	var actionBase: ActionBase { return reaper.actionBase }
	var dataBase: DataBase { return reaper.dataBase }
	
	init(reaper: Reaper, actionDelegateSet: ActionDelegateSet, clock: Clock) {
		self.clock = clock
		self.reaper = reaper
		self.actionDelegateSet = actionDelegateSet
	}
	
//	func moveShapeNode(_ shapeNode: ShapeNode, _ to: FP, _ dir: Direction) {
//		//		guard let pathNode = dataBase.pathNodeBase.getNodesAt(pos + DirectionToVector[direction]!).first, !pathNode.taken else {
//		//			error("Moving to a non-existing pathnode.")
//		//			return
//		//		}
//		guard let toPath = dataBase.pathNodeBase.getNodesAt(to).first else {
//			error("no to path.")
//			return
//		}
//		guard !toPath.taken else {
//			error("topatj path taken.")
//			return
//		}
//		shapeNode.pathNode!.taken = false
//		toPath.taken = true
//		let action = InstantAction.init(start: clock.evalTime + 1, actionType: .DontCare)
//		action.action = {_ in self.actionDelegateSet.shapeNodeActionDelegate.finishedMovingShapeNode(shapeNode, to)}
//		shapeNode.moving = true
//		shapeNode.direction = dir
//		actionBase.addAction(action)
//		let continuousAction = ContinuousAction(start: clock.evalTime, duration: 1, actionType: .DontCare)
//		let from = shapeNode.fpoint
//		let startTime = clock.evalTime
//		continuousAction.collapse = { time in
//			self.actionDelegateSet.shapeNodeActionDelegate.move(shapeNode: shapeNode, from: from, delta: to - from, startTime: startTime, duration: 1)}
//		actionBase.addAction(continuousAction)
//	}
//	
//	func addPathNode(at point: GP, time: Time) {
//		let instantAction = InstantAction.init(start: time, actionType: .DontCare)
//		instantAction.action = {_ in self.actionDelegateSet.pathNodeActionDelegate.addPathNode(at: point)}
//		actionBase.addInstantAction(instantAction)
//	}
//	
//	func addShapeNode(at point: GP, time: Time) {
//		let instantAction = InstantAction.init(start: time, actionType: .DontCare)
//		instantAction.action = {_ in self.actionDelegateSet.shapeNodeActionDelegate.addShapeNode(at: point)}
//		actionBase.addInstantAction(instantAction)
//	}
}
