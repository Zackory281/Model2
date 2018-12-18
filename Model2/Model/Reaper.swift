//
//  Reaper.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Reaper {
	var dataBase: DataReader
	var clock: Clock
	var actionBase: ActionBase
	
	init(dataBase: DataReader, actionBase: ActionBase, clock: Clock) {
		self.dataBase = dataBase
		self.actionBase = actionBase
		self.clock = clock
	}
}
