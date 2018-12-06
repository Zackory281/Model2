//
//  Utils.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

private var i: PATHID = 0

func getNodeId() -> PATHID {
	i += 1
	return i
}

func error(_ string: Any) {
	print(string)
}
