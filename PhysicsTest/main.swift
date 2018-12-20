//
//  main.swift
//  PhysicsTest
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

//print(orientedCollidable(-1, 0, 1, 0, -1, 1, 1, 1))
//print(collideTime(-1, 0, 1, 0, -1, 1, 1, 1))

//print(collideTime(float2x2(float2(0,0), float2(0,1)), float2x2(float2(1,0), float2(2,0))))

//print(insideLineOriented(float2(2, 1), float2x2(float2(4, 1), float2(0, 1))))

let mesha = Fixture([float2(0, 0), float2(1, 0), float2(1, 1), float2(0, 1)], [(0, 1), (1, 2), (2, 3), (3, 0)], float2(1.0, 1.0))
let meshb = Fixture([float2(0, 0), float2(1, 0), float2(1, 1), float2(0, 1)], [(0, 1), (1, 2), (2, 3), (3, 0)], float2(0.1, 0.1))
//print(isOrientedInside(float2(0, 0), mb: meshb))
//print(isDisjoint(mesha, mb: meshb))

let square = Fixture([float2(-2.875, -2.875), float2(2.875, -2.875), float2(2.875, 2.875), float2(-2.875, 2.875)], [(0, 1), (1, 2), (2, 3), (3, 0)], float2(0, 0))

let gem = Fixture([float2(0, 3.875), float2(-1.875, 2), float2(-1.875, -2), float2(0, -3.875), float2(1.875, -2), float2(1.875, 2)], [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 0)], float2(0, 0.0))

let gem2 = Fixture(mesh: gem.mesh, pos: float2(2, -6))
print(isDisjoint(gem2, mb: gem))
