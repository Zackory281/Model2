//
//  Node.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class PathNode: NSObject, Positionable{
	var fpoint: FPoint {set{gpoint=newValue.getGPoint()}get{return gpoint.getFPoint()}}
	var gpoint: GPoint
	var moved: Bool
	
	let id: PATHID
	var table = WeakDictionary<Direction, PathNode>()
	var outDegree: Int {get{table.reap();return table.count}}
	var outNodes: Set<PathNode> {get{return Set(table.toStrongDictionary().values)}}
	init(point: GPoint) {
		moved = true
		gpoint = point
		id = getNodeId()
	}
	
	override var description: String { get { return "PathNode: \(id), at \(gpoint)"}}
	override var debugDescription: String { get { return "PathNode: \(id), at \(gpoint)"}}
	
}
