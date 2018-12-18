//
//  Model.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Model : ModelAPI {
	
	var startTime: Time?
	
	let clock: Clock
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	let actionBase: ActionBase
	let dataBase: DataReader
	
	let commandQueue: CommandQueue
	
	let dateReader: DataReader
	let actionDelegateSet: ActionDelegateSet
	let actionCreater: ActionCreater
	let reaper: Reaper
	
	let actionEvaluator: ActionEvaluator
	
	func command(action: MC, time: Time) {
		commandQueue.queue(action, time: time) 
	}
	
	func evalute(to: Time) {
		if let st = startTime {
			actionEvaluator.evaluateTo(to - st)
		} else {
			startTime = to
		}
	}
	
	init(setting: ModelSetting) {
		self.clock = Clock(lastTime: START_TIME, evalTime: START_TIME)
		
		self.pathNodeBase = PathNodeBase(setting: setting)
		self.shapeNodeBase = ShapeNodeBase(setting: setting)
		self.actionBase = ActionBase()
		self.dataBase = DataReader(pathBase: pathNodeBase, shapeBase: shapeNodeBase)
		
		self.dateReader = DataReader(pathBase: pathNodeBase, shapeBase: shapeNodeBase)
		
		self.reaper = Reaper(dataBase: dateReader, actionBase: actionBase, clock: clock)
		
		let snad = ShapeNodeActionDelegate(dataBase: dateReader, clock: clock)
		let pnad = PathNodeActionDelegate(dataBase: dateReader, clock: clock)
		self.actionDelegateSet = ActionDelegateSet(shapeNodeActionDelegate: snad, pathNodeActionDelegate: pnad)
		self.actionCreater = ActionCreater(reaper: reaper, actionDelegateSet: actionDelegateSet, clock: reaper.clock)
		snad.actionCreater = actionCreater
		pnad.actionCreater = actionCreater
		
		self.actionEvaluator = ActionEvaluator(reaper: reaper, actionCreater: actionCreater)
		
		self.commandQueue = CommandQueue(actionCreater: actionCreater)
	}
	
	var priority: TickPri = MODEL_PRIORITY
	
}

protocol ModelAPI : class
{
	func command(action: ModelCommand, time: Time)
	func evalute(to: Time)
}

typealias MC = ModelCommand

enum ModelCommand : Equatable
{
	case addPathNode(at: GP)
	case addShapeNode(at: GP)
	case removePathNode(at: GP)
}

let MODEL_PRIORITY: TickPri = 0
let COMMAND_CONTROLLER_PRIORITY: TickPri = 2
let STATE_CONTROLLER_PRIORITY: TickPri = 3

let START_TIME: Time = 0
