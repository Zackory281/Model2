//
//  NodeScene
//  Model2
//
//  Created by Zackory Cramer on 12/11/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import SpriteKit

class NodeScene: SKScene, NodeRenderer {
	
	var nodeDict = Dictionary<NSObject, SKSpriteNode>()
	lazy var pointConverter: PointConverter = {return { liw in return self.view!.convert(liw, to: self)}}()
	
	func remove(_ obj: NSObject) {
		let sknode = nodeDict.removeValue(forKey: obj)!
		sknode.removeFromParent()
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
		if let movement = shapeNode.movement {
			sknode.zRotation = floa2Toangle(movement.delta)
		}
//		if shapeNode.moving {
//			sknode.zRotation = 0.1
//		} else {
//			sknode.zRotation = 0.0
//		}
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
	
	func render(_ projectileNode: ProjectileNode) {
		let sknode: SKSpriteNode
		if !nodeDict.keys.contains(projectileNode) {
			sknode = createProjectileNode(projectileNode: projectileNode)
			addChild(sknode)
			nodeDict[projectileNode] = sknode
		} else {
			sknode = nodeDict[projectileNode]!
		}
		sknode.position = projectileNode.fpoint.cgPoint
	}
	
	var imaginaryPathPair: (PathNode, SKNode)?
	
	func renderImagine(_ pathnode: PathNode) {
		if let prePath = imaginaryPathPair {
			if prePath.0 === pathnode {
				return
			}
			prePath.1.removeFromParent()
		}
		let sknode = createNewPathNode()
		sknode.position = pathnode.fpoint.cgPoint
		if !pathnode.valid {
			let colorize = SKAction.colorize(with: .systemRed, colorBlendFactor: 1, duration: 0)
			sknode.run(colorize)
		}
		let action = SKAction.repeatForever(.sequence([.fadeOut(withDuration: 0.5), .fadeIn(withDuration: 0.5)]))
		sknode.run(action)
		sknode.zPosition = PathNodeImagine_Z
		self.addChild(sknode)
		imaginaryPathPair = (pathnode, sknode)
	}
	
	private func createNewShapeNode() -> SKSpriteNode {
		let node = SKSpriteNode(texture: SKTexture(imageNamed: "tank"), size: CGSize(width: SCALE, height: SCALE))
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
		sknode.zPosition = Geometry_Z
		texture.filteringMode = .nearest
		return sknode
	}
	
	private func createProjectileNode(projectileNode: ProjectileNode) -> SKSpriteNode {
		let shnode = SKShapeNode(rect: CGRect(x: -30, y: -10, width: 60, height: 20))
		shnode.fillColor = .white
		shnode.strokeColor = .red
		shnode.zRotation = CGFloat(atan(projectileNode.delta.y / projectileNode.delta.x))
		guard let texture = self.view?.texture(from: shnode) else {
			error("No view or texture to generate texture.")
			return SKSpriteNode()
		}
		let sknode = SKSpriteNode(texture: texture)
		sknode.zPosition = Projectile_Z
		texture.filteringMode = .nearest
		return sknode
	}
}

let PathNode_Z: CGFloat = 1
let ShapeNode_Z: CGFloat = 2
let Geometry_Z: CGFloat = 0
let Projectile_Z: CGFloat = 10
let PathNodeImagine_Z: CGFloat = 5

let SCALE: CGFloat = 100
let LINE_WIDTH: CGFloat = SCALE / 10


extension Float {
	var cgFloat: CGFloat { return CGFloat(self) * SCALE }
}

extension float2 {
	var cgPoint: CGPoint { return CGPoint(x: CGFloat(x), y: CGFloat(y)) * SCALE}
}

extension CGPoint {
	@inline(__always) static func *(_ rhs: CGPoint, _ lhs: CGFloat) -> CGPoint {
		return CGPoint(x: rhs.x * lhs, y: rhs.y * lhs)
	}
	@inline(__always) static func *=(_ rhs: inout CGPoint, _ lhs: CGFloat) {
		rhs.x *= lhs
		rhs.y *= lhs
	}
	@inline(__always) static func +(_ rhs: CGPoint, _ lhs: CGPoint) -> CGPoint {
		return CGPoint(x: rhs.x + lhs.x, y: rhs.y + lhs.y)
	}
	@inline(__always) static func -(_ rhs: CGPoint, _ lhs: CGPoint) -> CGPoint {
		return CGPoint(x: rhs.x - lhs.x, y: rhs.y - lhs.y)
	}
	@inline(__always) static func +=(_ rhs: inout CGPoint, _ lhs: CGPoint) {
		rhs.x += lhs.x
		rhs.y += lhs.y
	}
	@inline(__always) static func -=(_ rhs: inout CGPoint, _ lhs: CGPoint) {
		rhs.x -= lhs.x
		rhs.y -= lhs.y
	}
}

