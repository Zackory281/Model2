//
//  ModelSetting.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ModelSetting {
	
	let minCorner, maxCorner: GPoint
	
	init(xi: IntC, yi: IntC, xf: IntC, yf: IntC) {
		minCorner = GPoint(xi, yi)
		maxCorner = GPoint(xf, yf)
	}
}
