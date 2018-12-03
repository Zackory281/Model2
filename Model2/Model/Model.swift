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
	let commandQueue: CommandQueue
	let tickBase: TickBase
	
	func command(action: MC) {
		commandQueue.queue(action)
	}
	
	init(setting: ModelSetting) {
		pathNodeBase = PathNodeBase(setting: setting)
		commandQueue = CommandQueue()
		tickBase = TickBase()
		
		tickBase.add(tickable: self)
	}
	
	var priority: TickPri = 0
	
	func tick() {
		tickBase.reapTick()
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
	case removePathNode(at: GP)
}

protocol Tickable : class {
	@discardableResult
	func tick(_ tick: Tick) -> Bool
	var priority: TickPri { get }
}
