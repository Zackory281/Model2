//
//  File.swift
//  Model2
//
//  Created by Zackory Cramer on 12/17/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import GameplayKit.GKQuadtree

class MotionGraph {
	
	let tree: GKQuadtree<Fixture>
	//let nodes: WeakDictionary<Fixture, GKQuadtreeNode>
	
	//func addMotionObject(
	
	init(_ minCorner: float2, _ maxCorner: float2) {
		tree = GKQuadtree<Fixture>(boundingQuad: GKQuad(quadMin: minCorner, quadMax: maxCorner), minimumCellSize: Float(0.1))
		//nodes = WeakDictionary<Fixture, GKQuadtreeNode>()
	}
}
