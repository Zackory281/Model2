//
//  UIController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/20/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

typealias PointConverter = (CGPoint) -> CGPoint
class UIController {
	
	var modelAPI: ModelAPI
	//var modelImagine: ModelImagine
	var renderer: NodeRenderer
	var input: UIInput
	
	var cameraController: CameraController
	var imagineContoller: UIImagineController
	var nodeModifier: UINodeModifier
	
	var dataBase: DataBase { return modelAPI.dataBase }
	
	init(model: ModelAPI, renderer: NodeRenderer, cameraController: CameraController, input: UIInput) {
		self.modelAPI = model
		self.renderer = renderer
		self.input = input
		self.cameraController = cameraController
		
		self.imagineContoller = UIImagineController(modelImagine: model.modelImagine, pointConverter: renderer.pointConverter)
		self.nodeModifier = UINodeModifier(model: model, converter: renderer.pointConverter)
		
		self.input.panHandler = cameraController
		self.input.scrollHandler = cameraController
		self.input.hoverHandler = imagineContoller
		self.input.clickHandler = nodeModifier
	}
	
	func update(_ time: Time) {
		modelAPI.evalute(to: time)
		render()
		renderImagine()
	}
	
	func render() {
		dataBase.removeNode(function: renderer.remove)
		dataBase.forEachShapeNode(function: renderer.render)
		dataBase.forEachPathNode(function: renderer.render)
		dataBase.forEachGeometryNode(function: renderer.render)
		dataBase.forEachProjectileNode(function: renderer.render)
	}
	
	func renderImagine() {
		if let imaginePathNode = dataBase.imagineData.imaginePathNode {
			renderer.renderImagine(imaginePathNode)
		}
	}
}

protocol NodeRenderer: AnyObject {
	var pointConverter: (CGPoint) -> CGPoint { get }
	func remove(_ obj: NSObject)
	func render(_ shapeNode: ShapeNode)
	func render(_ pathNode: PathNode)
	func render(_ geometryNode: GeometryNode)
	func render(_ projectileNode: ProjectileNode)
	func renderImagine(_ pathnode: PathNode)
}
