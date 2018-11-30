//
//  WeakDictionary.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

class WeakDictionary<KeyType: Hashable, ObjType: AnyObject>: NSObject {
	
	class Entry {
		weak var item: ObjType?
		init(_ item: ObjType) {
			self.item = item
		}
	}
	
	private var dictionary = Dictionary<KeyType, Entry>()
	
	override init() {
		super.init()
	}
	
	@discardableResult
	func insert(key: KeyType, obj: ObjType) -> Bool{
		guard !contains(key: key) else { return false }
		dictionary[key] = Entry(obj)
		return true
	}
	
	func get(key: KeyType) -> ObjType? {
		return dictionary[key]?.item
	}
	
	func contains(key: KeyType) -> Bool {
		guard let entry = dictionary[key] else { return false }
		return entry.item != nil
	}
	
	@discardableResult
	func remove(key: KeyType) -> ObjType? {
		return dictionary.removeValue(forKey: key)?.item
	}
}
