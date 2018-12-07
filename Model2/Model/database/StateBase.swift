//
//  StateBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/3/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class StateBase {
	
	var states: SinglyLinkedList<State>
	
	func addState(_ state: State) {
		states.append(value: state)
	}
	
	init() {
		states = SinglyLinkedList<State>()
	}
}
