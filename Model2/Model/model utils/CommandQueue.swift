//
//  ActionQueue.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class CommandQueue {
	
	var actionCreater: ActionCreater
	
	init(actionCreater: ActionCreater) {
		self.actionCreater = actionCreater
	}
	
	func queue(_ command: ModelCommand, time: Time) {
//		switch command {
//		case let ModelCommand.addPathNode(at: point):
//			actionCreater.addPathNode(at: point, time: time)
//		case let ModelCommand.addShapeNode(at: point):
//			actionCreater.addShapeNode(at: point, time: time)
//		default:
//			error(command, " handler not implemented.")
//			return
//		}
	}
}
