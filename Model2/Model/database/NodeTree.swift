//
//  NodeTree.swift
//  Model2
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import GameplayKit

class NodeTree<N: NSObject & Positionable> {
	
	let tree: GKQuadtree<N>
	var nodes: Dictionary<N, GKQuadtreeNode>
	var values: Dictionary<N, GKQuadtreeNode>.Keys {get{return nodes.keys}}

	init(_ minCorner: GP, _ maxCornder: GP) {
		tree = GKQuadtree<N>.init(boundingQuad: GKQuad(quadMin: float2(Float(minCorner.x), Float(minCorner.y)), quadMax: float2(Float(maxCornder.x), Float(maxCornder.y))), minimumCellSize: 0.5)
		nodes = Dictionary<N, GKQuadtreeNode>()
	}
	
	func getNodesAt(_ gpoint: GP) -> [N] {
		return getNodesAt(gpoint.f2)
	}
	
	func getNodesAt(_ fpoint: FP) -> [N] {
		return tree.elements(at: fpoint)
	}

	func remove(node: N) {
		guard let qnode = nodes[node] else { return }
		tree.remove(node, using: qnode)
	}

	func add(node: N) {
		if let _ = nodes[node] {
			remove(node: node)
		}
		nodes[node] = tree.add(node, at: node.fpoint)
	}

	func contains(node: N) -> Bool {
		return nodes.keys.contains(node)
	}

	func move(node: N) {
		add(node: node)
	}
}
