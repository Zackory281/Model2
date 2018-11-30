//
//  main.swift
//  ModelCommand
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation

let model = Model()
let weakdict = WeakDictionary<Direction, NSString>()
let s:NSString = "UP!"
weakdict.insert(key: .UP, obj: s)
print(weakdict.contains(key: .UP))
