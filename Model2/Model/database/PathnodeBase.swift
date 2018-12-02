//
//  PathnodeBase.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNodeBase {
	
	weak var nodeTree: NodeTree<t>?
	
	init(setting: ModelSetting) {
		let a = Array<t>()
		//nodeTree = NodeTree<PathNode>(setting.minCorner, setting.maxCorner)
	}
	
}

protocol t: Gridable {
	var hashable: AnyObject {get}
}
