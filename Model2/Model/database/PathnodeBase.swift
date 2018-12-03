//
//  PathnodeBase.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNodeBase: NodeTree<PathNode> {
	
	init(setting: ModelSetting) {
		super.init(setting.minCorner, setting.maxCorner)
	}
	
}
