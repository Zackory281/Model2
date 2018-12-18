//
//  Clock.swift
//  Model2
//
//  Created by Zackory Cramer on 12/15/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Clock {
	var lastTime: Time
	var evalTime: Time
	init(lastTime: Time, evalTime: Time) {
		self.lastTime = lastTime
		self.evalTime = evalTime
	}
}
