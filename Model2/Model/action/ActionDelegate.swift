//
//  ActionDelegate.swift
//  Model2
//
//  Created by Zackory Cramer on 12/16/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ActionDelegate {
	let dataBase: DataReader
	let clock: Clock
	var shapeNodeBase: ShapeNodeBase { return dataBase.shapeNodeBase }
	var pathNodeBase: PathNodeBase { return dataBase.pathNodeBase }
	var actionCreater: ActionCreater!
	
	init(dataBase: DataReader, clock: Clock) {
		self.dataBase = dataBase
		self.clock = clock
	}
}

class ActionDelegateSet {
	let shapeNodeActionDelegate: ShapeNodeActionDelegate
	let pathNodeActionDelegate: PathNodeActionDelegate
	init(shapeNodeActionDelegate: ShapeNodeActionDelegate, pathNodeActionDelegate: PathNodeActionDelegate) {
		self.shapeNodeActionDelegate = shapeNodeActionDelegate
		self.pathNodeActionDelegate = pathNodeActionDelegate
	}
}
