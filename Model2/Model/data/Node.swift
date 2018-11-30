//
//  Node.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNode: NSObject {
	let point: Point
	//let table: NSMapTable
	init(point: Point) {
		self.point = point
		//self.table = NSPointerArray(options: [NSPointerFunctions.Options.weakMemory])
		super.init()
		//table.insertPointer(self as! UnsafeMutablePointer, at: 0)
	}
}
