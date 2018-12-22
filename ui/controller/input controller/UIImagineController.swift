//
//  UIImagineController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class UIImagineController: HoverHandler {
	
	let modelImagine: ModelImagineAPI
	let pointConverter: PointConverter
	
	init(modelImagine: ModelImagineAPI, pointConverter: @escaping PointConverter) {
		self.modelImagine = modelImagine
		self.pointConverter = pointConverter
	}
	
	func updateHover(_ point: CGPoint) {
		let cpoint = pointConverter(point)
		modelImagine.imaginePathNode = toGP(point: cpoint)
	}
}

func toGP(point: CGPoint) -> GP {
	return GP(Int32(floor(point.x / SCALE)), Int32(floor(point.y / SCALE)))
}
