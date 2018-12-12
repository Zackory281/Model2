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
	
	func render(_ shapeNode: ShapeNode) {
		let sknode: SKSpriteNode
		if !nodeDict.keys.contains(shapeNode) {
			sknode = createNewShapeNode()
			addChild(sknode)
			nodeDict[shapeNode] = sknode
		} else {
			sknode = nodeDict[shapeNode]!
		}
		let act = SKAction.move(to: shapeNode.fpoint.cgPoint, duration: tickTime)
		act.timingMode = .linear
		sknode.run(act)
	}
	
	func render(_ pathNode: PathNode) {
		
	}
	
	private func createNewShapeNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: 100, height: 100))
		node.texture?.filteringMode = .linear
		if self.camera == nil {
			self.camera = cam
			self.camera!.xScale = 1
			self.camera!.yScale = 1
		}
		let node2 = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: 100, height: 100))
		node2.texture?.filteringMode = .nearest
		node2.run(SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 5))
		node2.position = CGPoint(x: 200, y: 100)
		addChild(node2)
		return node
	}
}
