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
			self.camera!.xScale = 2
			self.camera!.yScale = 2
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
			sknode.zRotation = 0
		}
	}
	
	func render(_ geometryNode: GeometryNode) {
		let sknode: SKSpriteNode
		if !nodeDict.keys.contains(geometryNode) {
			sknode = createGeometryNode(mesh: geometryNode.fixture.mesh)
			addChild(sknode)
			nodeDict[geometryNode] = sknode
		} else {
			sknode = nodeDict[geometryNode]!
		}
		sknode.position = geometryNode.fpoint.cgPoint
	}
	
	private func createNewShapeNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "square"), size: CGSize(width: SCALE, height: SCALE))
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
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "pathnode"), size: CGSize(width: SCALE, height: SCALE))
		node.texture?.filteringMode = .nearest
		node.zPosition = PathNode_Z
		return node
	}
	
	private func createGeometryNode(mesh: Mesh) -> SKSpriteNode {
		let cgpath = CGMutablePath()
		let vets = mesh.vets
		cgpath.move(to: vets[0].cgPoint)
		for i in stride(from: 1, to: vets.count, by: 1) {
			cgpath.addLine(to: vets[i].cgPoint)
		}
		cgpath.closeSubpath()
		let node = SKShapeNode(path: cgpath)
		node.lineWidth = LINE_WIDTH
		node.strokeColor = NSColor.white
		node.fillColor = NSColor.lightGray
		let minc = mesh.min.cgPoint
		let maxc = mesh.max.cgPoint
		let w = max(abs(minc.x), abs(maxc.x)) * 2 + LINE_WIDTH
		let h = max(abs(minc.y), abs(maxc.y)) * 2 + LINE_WIDTH
		guard let texture = self.view?.texture(from: node, crop: CGRect(x: -w/2, y: -h/2, width: w, height: h)) else {
			error("No view or texture to generate texture.")
			return SKSpriteNode()
		}
		let sknode = SKSpriteNode(texture: texture)
		texture.filteringMode = .nearest
		return sknode
	}
}

let PathNode_Z: CGFloat = 1
let ShapeNode_Z: CGFloat = 2

let SCALE: CGFloat = 100
let LINE_WIDTH: CGFloat = SCALE / 10


extension Float {
	var cgFloat: CGFloat { return CGFloat(self) * SCALE }
}

extension float2 {
	var cgPoint: CGPoint { return CGPoint(x: CGFloat(x), y: CGFloat(y)) * SCALE}
}

extension CGPoint {
	static func *(_ rhs: CGPoint, _ lhs: CGFloat) -> CGPoint {
		return CGPoint(x: rhs.x * lhs, y: rhs.y * lhs)
	}
}
