//
//  AStar.swift
//  ModelCommand
//
//  Created by Zackory Cramer on 12/23/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

class FlowField {
	
	//private var fringe: Heap<FP>
	private var goal: FP!
	private typealias Distance = Float
	private var map: [FP : Distance]
	private let gap: Float
	
	init(_ goal: FP, gap: Float) {
		//fringe = Heap<FP>(comparator)
		self.map = [FP : Distance]()
		self.gap = gap
		self.setGoal(goal)
	}
	
	private func setGoal(_ goal: FP) {
		self.goal = goal
		self.map.removeAll()
		self.map[goal] = 0
	}
	
	func getDelta(from point: FP) -> FP? {
		var mi = (Float.greatestFiniteMagnitude, float2(0, 0))
		if map[point] == nil {
			findPath(from: point)
		}
		mi = l(point: point, delta: float2(gap, 0), mi: mi)
		mi = l(point: point, delta: float2(-gap, 0), mi: mi)
		mi = l(point: point, delta: float2(0, gap), mi: mi)
		mi = l(point: point, delta: float2(0, -gap), mi: mi)
		mi = l(point: point, delta: float2(gap, gap), mi: mi)
		mi = l(point: point, delta: float2(-gap, gap), mi: mi)
		mi = l(point: point, delta: float2(gap, gap), mi: mi)
		mi = l(point: point, delta: float2(-gap, -gap), mi: mi)
//		if let n = map[point + float2(gap, 0)], n < d {
//			mi = float2(gap, 0)
//			d = n
//		}
//		if let n = map[point + float2(-gap, 0)], n < d {
//			mi = float2(-gap, 0)
//			d = n
//		}
//		if let n = map[point + float2(0, gap)], n < d {
//			mi = float2(0, gap)
//			d = n
//		}
//		if let n = map[point + float2(0, -gap)], n < d {
//			mi = float2(0, -gap)
//			d = n
//		}
		if mi.0 == 0 {
			return nil
		}
		return mi.1
	}
	
	@inline(__always) private func l(point: FP, delta: float2, mi: (Distance, float2)) -> (Distance, float2) {
		if let n = map[point + delta], n < mi.0 {
			return (n, delta)
		}
		return mi
	}
	
	var source: FP!
	
	func findPath(from source: FP) {
		//print("source", source)
		self.source = source
		var fringe = Heap<FP>(sort: self.comparator)
		fringe.insert(goal)
		while !fringe.isEmpty {
			let nowP = fringe.remove()!
			//print("iter", nowP, map[nowP]!)
			if nowP == source {
				break
			}
			for suc in newSuccessors(from: nowP) {
				//print("suc", suc)
				let newDist = map[nowP]! + distance(suc - nowP)
				if let oldDist = map[suc], oldDist <= newDist {
					continue
				} else {
					//print("insrt on", suc, newDist)
					map[suc] = newDist
					fringe.insert(suc)
				}
			}
		}
	}
	
	let root2: Float = 1.41421356237
	@inline(__always) private func distance(_ delta: FP) -> Distance {
		return abs(delta.x) + abs(delta.y) > gap ? root2 : 1
	}
	
	let zero = Float(0)
	func newSuccessors(from point: FP) -> [FP] {
//		var list = [FP]()
//		if map[point + float2(gap, 0)] == nil {
//			list.append(float2(gap, 0))
//		}
//		if map[point + float2(-gap, 0)] == nil {
//			list.append(float2(gap, 0))
//		}
//		if map[point + float2(0, gap)] == nil {
//			list.append(float2(0, gap))
//		}
//		if map[point + float2(0, -gap)] == nil {
//			list.append(float2(0, -gap))
//		}
		return [point+FP(gap, 0), point+FP(-gap, 0), point+FP(0, -gap), point+FP(0, gap),
				point+FP(gap, gap), point+FP(-gap, gap), point+FP(gap, -gap), point+FP(-gap, -gap)]
	}
	
	private func comparator(p1: FP, p2: FP) -> Bool {
//		if self.map[p1] == nil {
//			if self.map[p2] == nil {
//				return p1.lexicographicallyPrecedes(p2)
//			}
//			return false
//		}
//		if self.map[p2] == nil {
//			return true
//		}
		let o = self.map[p1]! - self.map[p2]! + self.getDistfrom(p1) - self.getDistfrom(p2)
		if o != 0 {
			return o < 0
		}
		return p1.lexicographicallyPrecedes(p2)
	}
	
	private func getDistfrom(_ to: FP) -> Distance {
		let d = to - source
		return d.x * d.x + d.y * d.y
	}
}

extension float2: Hashable {
	static func == (lhs: float2, rhs: float2) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(x)
		hasher.combine(y)
	}
}
