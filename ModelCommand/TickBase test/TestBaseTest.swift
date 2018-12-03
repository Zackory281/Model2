//
//  TestBaseTest.swift
//  ModelCommand
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class O: Tickable {
	func tick(_ tick: Tick) -> Bool {
		print("\(priority) ticked")
		return true
	}
	
	var priority: TickPri
	
	init(_ i: TickPri) {
		priority = i
	}
}

let tb = TickBase()

func runTBT() {
	tb.add(tickable: O(0))
	tb.add(tickable: O(3))
	tb.add(tickable: O(2))
	tb.add(tickable: O(53))
	tb.add(tickable: O(1))
	print(tb.reapTick())
}
