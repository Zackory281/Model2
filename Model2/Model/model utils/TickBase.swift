//
//  TickBase.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class TickBase {
	
	let list: LinkedList<Tickable>
	var tick: Tick = 0
	
	init() {
		list = LinkedList<Tickable>()
	}
	
	@discardableResult
	func reapTick() -> TickPri {
		var i: TickPri = 0
		for t in list {
			i += t.tick(tick) ? 1 : 0
		}
		return i
	}
	
	func add(tickable: Tickable) {
		guard let first = list.first else {
			list.append(tickable)
			return
		}
		let p = tickable.priority
		if first.priority > p {
			list.insert(element: tickable, at: 0)
			return
		}
		var cur: LinkedList<Tickable>.LinkedListValueNode = list.head!
		while let next = cur.next {
			if next.value.priority >= p {
				break
			}
			cur = next
		}
		list.insert(element: tickable, after: cur)
	}
}
