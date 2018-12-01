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
	var tick: TickC = 0
	
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
		print(list)
		guard let first = list.first else {
			list.append(tickable)
			return
		}
		let p = tickable.priority
		if first.priority > p {
			list.insert(tickable, at: 0)
			return
		}
		var seg: LinkedList<Tickable>.Node? = list.head!
		repeat {
			guard let pp = seg!.previous?.value.priority else {
				break
			}
			if pp > p {
				break
			}
			seg = seg!.previous
		} while seg != nil
		let next = seg!.next
		seg!.next = LinkedList<Tickable>.Node(value: tickable)
		seg!.next!.next = next
	}
}
