//
//  main.swift
//  ModelCommand
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation


let setting = ModelSetting(xi: -100, yi: -100, xf: 100, yf: 100)
let model = Model(setting: setting)
model.command(action: .addPathNode(at: GP(2, 3)))
model.command(action: .addShapeNode(at: GP(2, 3)))
model.tick()
//print(Action.addPathNode(at: GP(0,0)) == Action.addPathNode(at: GP(0,1)))
