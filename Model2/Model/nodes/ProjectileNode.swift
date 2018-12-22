//
//  ProjectileNode.swift
//  Model2
//
//  Created by Zackory Cramer on 12/21/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class ProjectileNode: NSObject, Positionable {
	
	var fpoint: FPoint
	var gpoint: GPoint{set{fpoint=newValue.f2}get{return fpoint.i2}}
	let startPoint: FP
	let delta: FP
	let startTime: Time
	let duration: Time
	weak var subject: Positionable?
	weak var object: Positionable?
	
	init(subject: Positionable, object: Positionable, startTime: Time, duration: Time) {
		self.subject = subject
		self.object = object
		self.fpoint = subject.fpoint
		self.startPoint = subject.fpoint
		self.delta = object.fpoint - startPoint
		self.startTime = startTime
		self.duration = duration
	}
}
