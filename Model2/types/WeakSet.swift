//
//  WeakSet.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

public class WeakSet<T>: Sequence, ExpressibleByArrayLiteral, CustomStringConvertible, CustomDebugStringConvertible {
	
	private var objects = NSHashTable<AnyObject>.weakObjects()
	
	public init(_ objects: [T]) {
		for object in objects {
			insert(object)
		}
	}
	
	public convenience required init(arrayLiteral elements: T...) {
		self.init(elements)
	}
	
	public var allObjects: [T] {
		return objects.allObjects as! [T]
	}
	
	public var count: Int {
		return objects.count
	}
	
	public func contains(_ object: T) -> Bool {
		return objects.contains(object as AnyObject)
	}
	
	public func insert(_ object: T) {
		objects.add(object as AnyObject)
	}
	
	public func remove(_ object: T) {
		objects.remove(object as AnyObject)
	}
	
	public func makeIterator() -> AnyIterator<T> {
		let iterator = objects.objectEnumerator()
		return AnyIterator {
			return iterator.nextObject() as? T
		}
	}
	
	public var description: String {
		return objects.description
	}
	
	public var debugDescription: String {
		return objects.debugDescription
	}
}
