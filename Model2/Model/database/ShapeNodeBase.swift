//
//  ShapeNodeBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ShapeNodeBase: NodeTree<ShapeNode> {
	
	init(setting: ModelSetting) {
		super.init(setting.minCorner, setting.maxCorner)
	}
	
	func reapMovement() {
		for shapeNode in values where shapeNode.moved {
			move(node: shapeNode)
		}
	}
	
}
