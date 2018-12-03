//
//  ShapeNode.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ShapeNode: NSObject, Positionable, Statable{
	
	// Positionable fields
	var fpoint: FPoint {get{return gpoint.getFPoint()}set{}}
	var gpoint: GPoint {get{return pathNode?.gpoint ?? .zero}set{}}
	var moved: Bool
	// Statable fields
	var states: LinkedList<NodeState>
	
	weak var pathNode: PathNode? {didSet{moved=true}}
	
	init(pathNode: PathNode) {
		self.moved = true
		self.states = LinkedList<NodeState>()
		self.pathNode = pathNode
	}
	
	func addState(_ state: NodeState) {
		states.addFirst(state)
	}
}
