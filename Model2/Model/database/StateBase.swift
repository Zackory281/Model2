//
//  StateBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class StateBase {
	
	var stateBuffer: LinkedList<State>
	var stateUpdated: LinkedList<State>
	
	func addState(_ state: State) {
		stateBuffer.append(state)
	}
	
	func addStateUpdated(_ state: State) {
		stateUpdated.addFirst(state)
	}
	
	func dumpStates() {
		stateBuffer = stateUpdated
		stateUpdated = LinkedList<State>()
	}
	
	init() {
		stateBuffer = LinkedList<State>()
		stateUpdated = LinkedList<State>()
	}
}
