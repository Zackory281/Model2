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
	var cam: SKCameraNode = SKCameraNode()
	
	func initialize() {
		if self.camera == nil {
			self.camera = cam
			self.camera!.xScale = 1
			self.camera!.yScale = 1
		}
	}
	
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
		if shapeNode.moving {
			sknode.zRotation = 0.1
		} else {
			sknode.zRotation = 0.0
		}
	}
	
	func render(_ pathNode: PathNode) {
		let sknode: SKSpriteNode
		if !nodeDict.keys.contains(pathNode) {
			sknode = createNewPathNode()
			addChild(sknode)
			nodeDict[pathNode] = sknode
		} else {
			sknode = nodeDict[pathNode]!
		}
		sknode.position = pathNode.fpoint.cgPoint
		if pathNode.taken {
			sknode.zRotation = 0.1
		} else {
			sknode.zRotation = 0.0
		}
	}
	
	private func createNewShapeNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: 100, height: 100))
		node.texture?.filteringMode = .nearest
		//		let node2 = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: 100, height: 100))
		//		node2.texture?.filteringMode = .nearest
		//		node2.run(SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 5))
		//		node2.position = CGPoint(x: 200, y: 100)
		//		addChild(node2)
		node.zPosition = ShapeNode_Z
		return node
	}
	
	private func createNewPathNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "pathnode"), size: CGSize(width: 100, height: 100))
		node.texture?.filteringMode = .nearest
		node.zPosition = PathNode_Z
		return node
	}
}

let PathNode_Z: CGFloat = 1
let ShapeNode_Z: CGFloat = 2
