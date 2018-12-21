//
//  GeoemtryBase.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import GameplayKit.GKQuadtree

class GeometryNodeBase: NodeTree<GeometryNode> {
	
	init(setting: ModelSetting) {
		super.init(setting.minCorner, setting.maxCorner)
	}
	
	override func add(node: GeometryNode) {
		guard isDisjoint(node, ignore: node) else {
			print("Adding ", node, " but is not disjoint in map.")
			return
		}
		if let _ = nodes[node] {
			remove(node: node)
		}
		nodes[node] = self.tree.add(node, in: node.quad)
	}
	
	func isDisjoint(_ geometryNode: GeometryNode, ignore: GeometryNode? = nil) -> Bool {
		let possibleOverlaps = self.tree.elements(in: getSearchQuad(geometryNode.fpoint))
		let fix = geometryNode.fixture
		for posove in possibleOverlaps {
			if posove !== ignore && !isFixtureDisjoint(fix, mb: posove.fixture) {
				return false
			}
		}
		return true
	}
	
	private func getSearchQuad(_ center: float2) -> GKQuad {
		return GKQuad(quadMin: center - float2(10, 10), quadMax: center + float2(10, 10))
	}
	
}

extension GeometryNode {
	var quad: GKQuad { return GKQuad(quadMin: self.fixture.mesh.min + self.fixture.pos, quadMax: self.fixture.mesh.max + self.fixture.pos)}
}
