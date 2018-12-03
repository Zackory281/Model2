//
//  Reaper.swift
//  Model2
//
//  Created by Zackory Cramer on 12/2/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class Reaper {
	
	var statables: LinkedList<Statable>
	var instantStatable: LinkedList<Statable>
	
	init() {
		statables = LinkedList<Statable>()
		instantStatable = LinkedList<Statable>()
	}
}
