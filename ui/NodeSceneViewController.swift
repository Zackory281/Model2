//
//  NodeSceneViewController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/11/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import SpriteKit

class NodeSceneViewController: NSViewController, SKSceneDelegate {
	
	
	@IBOutlet var skView: SKView!
	var dataReader: DataBase?
	var model: Model?
	var nodeScene: NodeScene!
	
	func update(_ currentTime: TimeInterval, for scene: SKScene) {
		guard let model = self.model else { return }
		model.evalute(to: currentTime)
		guard let dataReader = self.dataReader else { return }
		dataReader.forEachShapeNode(function: nodeScene.render)
		dataReader.forEachPathNode(function: nodeScene.render)
		dataReader.forEachGeometryNode(function: nodeScene.render)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let view = self.skView {
			nodeScene = NodeScene.init(size: CGSize(width: 800, height: 600))
			nodeScene.initialize()
			nodeScene.delegate = self
			nodeScene.backgroundColor = .black
			nodeScene.scaleMode = .aspectFill
			view.preferredFramesPerSecond = 30
			view.presentScene(nodeScene)
			
			view.ignoresSiblingOrder = true
			
			view.showsFPS = true
			view.showsNodeCount = true
		}
	}
}
