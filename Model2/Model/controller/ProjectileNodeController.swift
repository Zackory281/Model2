//
//  ProjectileNodeController.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ProjectilNodeController: Controller, ProjectilControllerDelegate {
	
	var dataBase: DataBase
	
	func updateProjectilePosition(_ projectilNode: ProjectileNode) {
		projectilNode.fpoint = projectilNode.startPoint + Float((evalTime - projectilNode.startTime) / projectilNode.duration) * projectilNode.delta
		projectileBase.move(node: projectilNode)
	}
	
	func finishProjectile(_ projectileNode: ProjectileNode) {
		projectileBase.remove(node: projectileNode)
	}
	
	func fire(from: Positionable, to: Positionable, time: Time, duration: Time) {
		let projectileNode = ProjectileNode(subject: from, object: to, startTime: time, duration: duration)
		projectileBase.add(node: projectileNode)
		actionBase.addInstantAction(InstantAction(start: time + duration){ [weak projectileNode] in
			guard let pnode = projectileNode else {
				return false
			}
			self.finishProjectile(pnode)
			return true
		})
		let caction = ContinuousAction(start: time, duration: duration, actionType: .DontCare)
		caction.collapse = { [weak projectileNode] in
			guard let pnode = projectileNode else {
				return false
			}
			self.updateProjectilePosition(pnode)
			return true
		}
		actionBase.addContinuousAction(caction)
	}
	
	func processCommand(_ cmd: MC, time: Time) -> Bool {
		return false
	}
	
	init(dataBase: DataBase) {
		self.dataBase = dataBase
	}
}

protocol ProjectilControllerDelegate {
	func fire(from: Positionable, to: Positionable, time: Time, duration: Time)
}
