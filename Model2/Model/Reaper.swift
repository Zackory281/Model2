//
//  Reaper.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Reaper {
	var dataBase: DataBase
	var clock: Clock
	var actionBase: ActionBase
	
	init(dataBase: DataBase, actionBase: ActionBase, clock: Clock) {
		self.dataBase = dataBase
		self.actionBase = actionBase
		self.clock = clock
	}
}
