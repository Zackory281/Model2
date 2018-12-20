//
//  PathNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNodeController: Controller {
	
	let dataBase: DataBase
	
	func addPathNode(_ point: GP) {
		guard pathNodeBase.getNodesAt(point).isEmpty else {
			error("Adding a pathNode to where there's already a pathNode.")
			return
		}
		let pathNode = PathNode(point: point)
		pathNodeBase.add(node: pathNode)
	}
	
	init(dataBase: DataBase) {
		self.dataBase = dataBase
	}
	
	func processCommand(_ cmd: MC, time: Time) -> Bool {
		switch cmd {
		case let .addPathNode(at: point):
			/// TODO
			actionBase.addAction(InstantAction(start: time) { [unowned self] in
				self.addPathNode(point)
			})
		default:
			return false
		}
		return true
	}
	
}
