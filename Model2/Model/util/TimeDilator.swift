//
//  TimeDialator.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class TimeDilator {
	
	var startTime: Time?
	var lastTime: Time!
	
	func incoming(time: Time) -> Time {
		guard let startTime = startTime else {
			self.startTime = time
			self.lastTime = time
			return 0
		}
		var delta = time - lastTime
		delta *= abs(sin(time)) * 30
		lastTime = time
		//print(delta)
		return time - startTime// + delta //+ delta
	}
}
