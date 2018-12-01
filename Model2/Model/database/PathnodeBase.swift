//
//  PathnodeBase.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNodeBase {
	
	let nodeTree: NodeTree<PathNode>
	
	init(setting: ModelSetting) {
		nodeTree = NodeTree<PathNode>(setting.minCorner, setting.maxCorner)
	}
}
