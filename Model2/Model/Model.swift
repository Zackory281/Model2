//
//  Model.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Model : ModelAPI, Tickable {
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	let stateBase: StateBase
	
	let commandQueue: CommandQueue
	let tickBase: TickBase
	let reaper: Reaper
	
	let stateController: StateController
	let commandController: CommandController
	
	let dateReader: DataReader
	
	func command(action: MC) {
		commandQueue.queue(action)
	}
	
	/// Add a NodeState
	func addState(state: State) {
		stateBase.addState(state)
	}
	
	init(setting: ModelSetting) {
		pathNodeBase = PathNodeBase(setting: setting)
		shapeNodeBase = ShapeNodeBase(setting: setting)
		stateBase = StateBase()
		
		dateReader = DataReader(pathBase: pathNodeBase, shapeBase: shapeNodeBase)
		
		commandQueue = CommandQueue()
		tickBase = TickBase()
		
		reaper = Reaper(commandQueue: commandQueue, stateBase: stateBase, pathNodeBase: pathNodeBase, shapeNodeBase: shapeNodeBase)
		commandController = CommandController(reaper: reaper)
		stateController = StateController(reaper: reaper)
		
		tickBase.add(tickable: self)
		tickBase.add(tickable: commandController)
		tickBase.add(tickable: stateController)
	}
	
	var priority: TickPri = MODEL_PRIORITY
	
	func tick() {
		tickBase.reapTick()
		tickBase.tick += 1
	}
	
	/// DO NOT CALL if you ticking Model
	@discardableResult func tick(_ tick: Tick) -> Bool {
		return true
	}
}

protocol ModelAPI : class
{
	func command(action: ModelCommand)
}

typealias MC = ModelCommand

enum ModelCommand : Equatable
{
	case addPathNode(at: GP)
	case addShapeNode(at: GP)
	case removePathNode(at: GP)
}

protocol Tickable : class {
	@discardableResult
	func tick(_ tick: Tick) -> Bool
	var priority: TickPri { get }
}

let MODEL_PRIORITY: TickPri = 0
let COMMAND_CONTROLLER_PRIORITY: TickPri = 2
let STATE_CONTROLLER_PRIORITY: TickPri = 3
