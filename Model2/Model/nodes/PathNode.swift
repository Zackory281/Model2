//
//  Node.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class PathNode: NSObject, Positionable{
	var fpoint: FPoint {set{gpoint=(newValue - float2(0.5, 0.5)).i2}get{return gpoint.f2 + float2(0.5, 0.5)}}
	var gpoint: GPoint
	var taken: Bool
	
	let id: PATHID
	var table = WeakDictionary<Direction, PathNode>()
	var outDegree: Int {get{table.reap();return table.count}}
	var outNodes: Set<PathNode> {get{return Set(table.toStrongDictionary().values)}}
	
	var valid: Bool
	
	init(point: GPoint, valid: Bool = true) {
		taken = false
		gpoint = point
		self.valid = valid
		id = getNodeId()
	}
	
	override var description: String { get { return "PathNode: \(id), at \(gpoint)"}}
	override var debugDescription: String { get { return "PathNode: \(id), at \(gpoint)"}}
	
}
