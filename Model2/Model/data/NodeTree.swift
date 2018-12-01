//
//  NodeTree.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import GameplayKit

class NodeTree<N: NSObject>: NSObject {
	
	let tree: GKQuadtree<N>
	var nodes: Dictionary<N, GKQuadtreeNode>
	
	init(_ minCorner: GP, _ maxCornder: GP) {
		tree = GKQuadtree<N>.init(boundingQuad: GKQuad(quadMin: float2(Float(minCorner.x), Float(minCorner.y)), quadMax: float2(Float(maxCornder.x), Float(maxCornder.y))), minimumCellSize: 0.5)
		nodes = Dictionary<N, GKQuadtreeNode>()
	}
	
	func remove(node: N) {
		guard let qnode = nodes[node] else { return }
		tree.remove(node, using: qnode)
	}
	
	func add(node: N, _ point: GPoint) {
		if let _ = nodes[node] {
			remove(node: node)
		}
		nodes[node] = tree.add(node, at: point.f2)
	}
	
	func contains(node: N) -> Bool {
		return nodes.keys.contains(node)
	}
	
	func move(node: N, _ p: GPoint) {
		add(node: node, p)
	}
}

extension GPoint {
	var f2: float2 { get { return float2(Float(x), Float(y))}}
}
