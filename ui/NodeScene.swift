//
//  NodeScene
//  Model2
//
//  Created by Zackory Cramer on 12/11/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import SpriteKit

class NodeScene: SKScene {
	
	var nodeDict = Dictionary<NSObject, SKSpriteNode>()
	
	func render(_ shapeNode: ShapeNode) {
		let sknode: SKSpriteNode
		if !nodeDict.keys.contains(shapeNode) {
			sknode = createNewShapeNode()
			addChild(sknode)
			nodeDict[shapeNode] = sknode
		} else {
			sknode = nodeDict[shapeNode]!
		}
		sknode.position = shapeNode.fpoint.cgPoint
	}
	
	func render(_ pathNode: PathNode) {
		
	}
	
	private func createNewShapeNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: 32, height: 32))
		node.texture?.filteringMode = .nearest
		self.camera!.xScale = 1000
		self.camera!.yScale = 1000
		return node
	}
}
