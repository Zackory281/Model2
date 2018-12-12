//
//  NodeMisc.swift
//  Model2
//
//  Created by Zackory Cramer on 12/1/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

//class NodeAbstract: NSObject {
//	
//	var fpoint: FPoint {get{
//		if _gmoved {
//			_fpoint = gpoint.getFPoint()
//		}
//		return _fpoint
//		}set{_fpoint = newValue; _fmoved = true}}
//	var gpoint: GP {get{return .zero}set{}}
//	var moved: Bool { return _fmoved || _gmoved}
//	private var _fpoint: FPoint
//	private var _gpoint: GPoint
//	private var _fmoved: Bool = false
//	private var _gmoved: Bool = false
//	
//	init(fpoint: FPoint) {
//		(_fpoint, _gpoint) = (fpoint, fpoint.getGPoint())
//	}
//	
//	init(gpoint: GPoint) {
//		(_fpoint, _gpoint) = (gpoint.getFPoint(), gpoint)
//	}
//}

protocol Positionable: class {
	var fpoint: FPoint{get set}
	var gpoint: GPoint{get set}
	/// Positionable marks it true, Client marks it false
	var moved: Bool {get set}
}

protocol Statable: class {
	var states: SinglyLinkedList<State> {get set}
}
