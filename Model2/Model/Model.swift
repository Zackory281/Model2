//
//  Model.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Model : ModelAPI {
	
	var startAbsTime: Time
	
	let clock: Clock
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	let geometryNodeBase: GeometryNodeBase
	let projectileBase: ProjectileBase
	let actionBase: ActionBase
	let dataBase: DataBase
	
	let commandQueue: CommandQueue
	
	let actionDelegateSet: ActionDelegateSet
	let actionCreater: ActionCreater
	let reaper: Reaper
	
	let actionEvaluator: ActionEvaluator
	
	let controllerSet: ControllerSet
	
	let timeDilator: TimeDilator
	
	lazy var modelImagine: ModelImagineAPI! = { return ModelImagine.init(model: self) }()
	
	func command(action: MC, time: Time) {
		//commandQueue.queue(action, time: time)
		controllerSet.feed(action, time)
	}
	
	func evalute(to: Time) {
		actionEvaluator.evaluateTo(timeDilator.incoming(time: to))
		if modelImagine != nil {
			modelImagine!.update()
		}
	}
	
	init(setting: ModelSetting) {
	  	self.startAbsTime = Date().timeIntervalSince1970
		self.clock = Clock(lastTime: START_TIME, evalTime: START_TIME)
		self.timeDilator = TimeDilator()
		
		self.pathNodeBase = PathNodeBase(setting: setting)
		self.shapeNodeBase = ShapeNodeBase(setting: setting)
		self.geometryNodeBase = GeometryNodeBase(setting: setting)
		self.projectileBase = ProjectileBase(setting: setting)
		self.actionBase = ActionBase()
		self.dataBase = DataBase(pathBase: pathNodeBase, shapeBase: shapeNodeBase, geometryBase: geometryNodeBase, projectileBase: projectileBase, actionBase: actionBase, clock: clock)
		
		self.reaper = Reaper(dataBase: dataBase, actionBase: actionBase, clock: clock)
		
		let snad = ShapeNodeActionDelegate(dataBase: dataBase, clock: clock)
		let pnad = PathNodeActionDelegate(dataBase: dataBase, clock: clock)
		self.actionDelegateSet = ActionDelegateSet(shapeNodeActionDelegate: snad, pathNodeActionDelegate: pnad)
		self.actionCreater = ActionCreater(reaper: reaper, actionDelegateSet: actionDelegateSet, clock: reaper.clock)
		snad.actionCreater = actionCreater
		pnad.actionCreater = actionCreater
		
		self.actionEvaluator = ActionEvaluator(reaper: reaper, actionCreater: actionCreater)
		
		self.commandQueue = CommandQueue(actionCreater: actionCreater)
		
		self.controllerSet = ControllerSet(dataBase: dataBase)
	}
	
	var priority: TickPri = MODEL_PRIORITY
	
}

protocol ModelAPI : class
{
	var startAbsTime: Time { get }
	var modelImagine: ModelImagineAPI! { get }
	var dataBase: DataBase { get }
	func command(action: ModelCommand, time: Time)
	func evalute(to: Time)
}

protocol ModelImagineAPI: class {
	var imaginePathNode: GP? { get set }
	func update()
}

typealias MC = ModelCommand

enum ModelCommand : Equatable
{
	case addPathNode(at: GP)
	case addShapeNode(at: GP)
	case addGeoemtryNode(type: GeometryType, dir: Direction, at: GP)
	case removePathNode(at: GP)
}

let MODEL_PRIORITY: TickPri = 0
let COMMAND_CONTROLLER_PRIORITY: TickPri = 2
let STATE_CONTROLLER_PRIORITY: TickPri = 3

let START_TIME: Time = 0
