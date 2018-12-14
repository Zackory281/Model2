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

//let fix = Fixture([float2(-1, -1), float2(1, -1), float2(1, 1), float2(-1, 1)], [int2(0, 0), int2(1, 2), int2(3, 2), int2(3, 0)], float2(2, 2))
//let ptmo = PointMotion.init(v1: float2(2, -1), v2: float2(2, 4))
//
//let cTime = collideTime(motion: ptmo, fixture: fix)
//let collidePoint = ptmo.getPos(at: cTime)
//print(cTime , " collide at ", collidePoint)

//print(insideLineOriented(float2(2, 1), float2x2(float2(4, 1), float2(0, 1))))

let mesha = Fixture([float2(0, 0), float2(1, 0), float2(1, 1), float2(0, 1)], [(0, 1), (1, 2), (2, 3), (3, 0)], float2(0, 0))
let meshb = Fixture([float2(0, 0), float2(1, 0), float2(1, 1), float2(0, 1)], [(0, 1), (1, 2), (2, 3), (3, 0)], float2(0.1, 0.1))
print(isOrientedInside(float2(0, 0), mb: mesha))
//print(isDisjoint(mesha, mb: meshb))
