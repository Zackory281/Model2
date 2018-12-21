//
//  UIController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/20/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class UIController {
	
	var modelAPI: ModelAPI
	var renderer: NodeRenderer
	var input: UIInput
	
	var cameraController: CameraController
	
	var dataBase: DataBase { return modelAPI.dataBase }
	
	init(model: ModelAPI, renderer: NodeRenderer, cameraController: CameraController, input: UIInput) {
		self.modelAPI = model
		self.renderer = renderer
		self.input = input
		self.cameraController = cameraController
		
		self.input.panHandler = cameraController
		self.input.scrollHandler = cameraController
	}
	
	func update(_ time: Time) {
		modelAPI.evalute(to: time)
		render()
	}
	
	func render() {
		dataBase.forEachShapeNode(function: renderer.render)
		dataBase.forEachPathNode(function: renderer.render)
		dataBase.forEachGeometryNode(function: renderer.render)
	}
}
