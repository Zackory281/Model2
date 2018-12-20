//
//  main.swift
//  ModelCommand
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import GameplayKit

//let setting = ModelSetting(xi: -100, yi: -100, xf: 100, yf: 100)
//let model = Model(setting: setting)
//model.command(action: .addPathNode(at: GP(2, 3)), time: 0.0)
//model.command(action: .addShapeNode(at: GP(2, 3)), time: 0.01)
//model.evalute(to: 0.02)
let tree = GKQuadtree<NSObject>(boundingQuad: GKQuad(quadMin: float2(-10, -10), quadMax: float2(10, 10)), minimumCellSize: 0.1)
tree.add(NSObject(), in: GKQuad(quadMin: float2(0, 0), quadMax: float2(1, 1)))
print(tree.elements(in: GKQuad(quadMin: float2(0.5, -0.5), quadMax: float2(2, 2))))

