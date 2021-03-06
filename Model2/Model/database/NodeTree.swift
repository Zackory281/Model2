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
	var nodesToRemove: Set<N>

	init(_ minCorner: GP, _ maxCornder: GP, minCellSize: Float = 0.5) {
		tree = GKQuadtree<N>.init(boundingQuad: GKQuad(quadMin: float2(Float(minCorner.x), Float(minCorner.y)), quadMax: float2(Float(maxCornder.x), Float(maxCornder.y))), minimumCellSize: minCellSize)
		nodes = Dictionary<N, GKQuadtreeNode>()
		nodesToRemove = Set<N>()
	}
	
	func getNodesIn(_ minCorner: FP, _ maxCorner: FP) -> [N] {
		return tree.elements(in: GKQuad(quadMin: minCorner, quadMax: maxCorner))
	}
	
	func getNodesAt(_ gpoint: GP) -> [N] {
		return getNodesAt(gpoint.f2)
	}
	
	func getNodesAt(_ fpoint: FP) -> [N] {
		return tree.elements(at: fpoint)
	}

	func remove(node: N) {
		guard let qnode = nodes.removeValue(forKey: node) else { return }
		tree.remove(node, using: qnode)
		nodesToRemove.insert(node)
	}
	
	@discardableResult func flushRemove() -> Set<N> {
		let r = self.nodesToRemove
		self.nodesToRemove.removeAll()
		return r
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
		guard let qnode = nodes[node] else { return }
		self.tree.remove(node, using: qnode)
		tree.add(node, at: node.fpoint)
	}
}
