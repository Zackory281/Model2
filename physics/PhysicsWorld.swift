//
//  PhysicsWorld.swift
//  Model2
//
//  Created by Zackory Cramer on 12/17/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

typealias OBJID = UInt16

class PhysicsWorld {
	
	var objects: Dictionary<OBJID, Fixture>
	
	init() {
		self.objects = Dictionary<OBJID, Fixture>()
	}
}
