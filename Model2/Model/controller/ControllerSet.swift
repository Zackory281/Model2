//
//  ControllerSet.swift
//  Model2
//
//  Created by Zackory Cramer on 12/18/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class ControllerSet {
	
	let shapeNodeController: ShapeNodeController
	let pathNodeController: PathNodeController
	let geometryNodeController: GeometryNodeController
	let projectileNodeController: ProjectilNodeController
	var controllers: WeakSet<Controller>
	
	func feed(_ cmd: MC, _ time: Time) {
		for controller in controllers {
			if controller.processCommand(cmd, time: time) {
				return
			}
		}
		error("weird command ", cmd, " at time: ", time)
	}
	
	init(dataBase: DataBase) {
		self.shapeNodeController = ShapeNodeController(dataBase: dataBase)
		self.pathNodeController = PathNodeController(dataBase: dataBase, shapeNodeControllerDelegate: shapeNodeController)
		self.geometryNodeController = GeometryNodeController(dataBase: dataBase)
		self.projectileNodeController = ProjectilNodeController(dataBase: dataBase)
		self.controllers = WeakSet<Controller>()
		
		self.shapeNodeController.projectileDelegate = projectileNodeController
		
		controllers.insert(shapeNodeController)
		controllers.insert(pathNodeController)
		controllers.insert(geometryNodeController)
		controllers.insert(projectileNodeController)
	}
}

protocol Controller: AnyObject {
	
	/// Processes the command at the given time.
	/// - Parameters:
	/// 	- cmd: The command.
	///		- time: The time issued.
	/// - returns: Whether the command process was successful.
	func processCommand(_ cmd: MC, time: Time) -> Bool
	
	var dataBase: DataBase { get }
}

extension Controller {
	
	var shapeNodeBase: ShapeNodeBase { return dataBase.shapeNodeBase }
	var pathNodeBase: PathNodeBase { return dataBase.pathNodeBase }
	var geometryNodeBase: GeometryNodeBase { return dataBase.geometryNodeBase }
	var projectileBase: ProjectileBase { return dataBase.projectileBase }
	var clock: Clock { return dataBase.clock }
	var evalTime: Time { return dataBase.clock.evalTime }
	var actionBase: ActionBase { return dataBase.actionBase }
}
