//
//  ModelImagine.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ModelImagine: ModelImagineAPI {
	
	var imaginePathNode: GP?
	var imaginePathNodePre: GP?
	
	let model: Model
	let dataBase: DataBase
	var imagineData: ImagineData { return dataBase.imagineData }
	var pathNodeBase: PathNodeBase { return dataBase.pathNodeBase }
	var shapeNodeBase: ShapeNodeBase { return dataBase.shapeNodeBase}
	var shapeNodeController: ShapeNodeController { return model.controllerSet.shapeNodeController }
	var pathNodeController: PathNodeController { return model.controllerSet.pathNodeController }
	
	func update() {
		if let ipn = imaginePathNode {
			if imaginePathNode != imaginePathNodePre {
				imaginePathNodePre = ipn
				imagineData.imaginePathNode = PathNode(point: ipn, valid: pathNodeController.canPlacePathNode(at: ipn))
			}
			
		} else {
			imagineData.imaginePathNode = nil
		}
	}
	
	init(model: Model) {
		self.model = model
		self.dataBase = model.dataBase
	}
}

class ImagineData {
	var imaginePathNode: PathNode?
}
