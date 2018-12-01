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
	
	let list, queue: LinkedList<ModelCommand>
	
	init() {
		list = LinkedList<ModelCommand>()
		queue = LinkedList<ModelCommand>()
	}
	
	func queue(_ command: ModelCommand) {
		queue.append(command)
	}
	
	func pop() -> ModelCommand? {
		if let c = queue.head {
			list.remove(node: c)
			list.insert(c.value, at: 0)
			return c.value
		}
		return nil
	}
}
