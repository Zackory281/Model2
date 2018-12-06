//
//  PathNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/1/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class CommandController: Tickable {
	
	let reaper: Reaper
	var shapeBase: ShapeNodeBase { get { return reaper.shapeNodeBase } }
	var pathBase: PathNodeBase { get { return reaper.pathNodeBase } }
	
	private var commandQueue: CommandQueue { get { return reaper.commandQueue } }
	private var tick: Tick
	
	init(reaper: Reaper) {
		self.reaper = reaper
		self.tick = 0
	}
	
	func addShapeNode(at point: GP) {
		guard let pathNode = pathBase.getNodesAt(point).first else {
			error("cant add node at \(point), no pathnode")
			return
		}
		let shapeNode = ShapeNode(pathNode: pathNode)
		reaper.stateBase.addState(NodeState(startTick: tick, duration: 1, nodeStateType: .idle, subject: shapeNode))
		shapeBase.add(node: shapeNode)
	}
	
	func addPathNode(at point: GP) {
		guard pathBase.getNodesAt(point).isEmpty else {
			error("adding a pathnode at taken \(point)")
			return
		}
		let pathNode = PathNode(point: point)
		pathBase.add(node: pathNode)
	}
	
	func tick(_ tick: Tick) -> Bool {
		self.tick = tick
		while let cmd = commandQueue.pop() {
			switch cmd {
			case let .addPathNode(at: point):
				addPathNode(at: point)
			case let .addShapeNode(at: point):
				addShapeNode(at: point)
			default:
				print("No handler for cmd: ", cmd)
			}
		}
		return false
	}
	
	var priority: TickPri = COMMAND_CONTROLLER_PRIORITY
	
}
