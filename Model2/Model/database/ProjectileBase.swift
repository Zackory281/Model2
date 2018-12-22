//
//  ProjectileBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ProjectileBase: NodeTree<ProjectileNode> {
	
	init(setting: ModelSetting) {
		super.init(setting.minCorner, setting.maxCorner, minCellSize: 0.01)
	}
	
}
