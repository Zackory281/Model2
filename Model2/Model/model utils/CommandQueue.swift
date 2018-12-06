//
//  ActionQueue.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class CommandQueue {
	
	typealias Element = MC
	
	var list, queue: SinglyLinkedList<ModelCommand>
	
	init() {
		list = SinglyLinkedList<ModelCommand>()
		queue = SinglyLinkedList<ModelCommand>()
	}
	
	func queue(_ command: ModelCommand) {
		queue.append(value: command)
	}
	
	func pop() -> ModelCommand? {
		if let c = queue.popHead() {
			list.append(value: c)
			return c
		}
		return nil
	}
}
