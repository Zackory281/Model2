//
//  Reaper.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Reaper {
	
	let pathNodeBase: PathNodeBase
	let shapeNodeBase: ShapeNodeBase
	let stateBase: StateBase
	var stateController: StateController!
	
	let commandQueue: CommandQueue
	
	//var needProcessStates: SinglyLinkedList
	
	func addStatesToRemove(_ state: State) {
		print("remove state: ", state)
	}
	
	init(commandQueue: CommandQueue, stateBase: StateBase, pathNodeBase: PathNodeBase, shapeNodeBase: ShapeNodeBase) {
		self.stateBase = stateBase
		self.pathNodeBase = pathNodeBase
		self.shapeNodeBase = shapeNodeBase
		self.commandQueue = commandQueue
	}
}
