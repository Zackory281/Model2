//
//  UINodeModifier.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class UINodeModifier: ClickHandler {
	
	let model: ModelAPI
	let converter: PointConverter
	
	init(model: ModelAPI, converter: @escaping PointConverter) {
		self.model = model
		self.converter = converter
	}
	func clicked(_ point: CGPoint) {
		//print(Date().timeIntervalSince1970 - model.startAbsTime)
		model.command(action: .addShapeNode(at: toGP(point: converter(point))), time: Date().timeIntervalSince1970 - model.startAbsTime)
	}
}
