//
//  main.swift
//  PhysicsTest
//
//  Created by Zackory Cramer on 12/5/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import Foundation
import simd

print(collideTime(p1: float2(2.0, -1.0), p2: float2(2.0, 4.0), p3: float2(1.0, 1.0), p4: float2(3.0, 1.0)))
//print(orientedCollidable(-1, 0, 1, 0, -1, 1, 1, 1))
//print(collideTime(-1, 0, 1, 0, -1, 1, 1, 1))
let fix = Fixture([float2(-1, -1), float2(1, -1), float2(1, 1), float2(-1, 1)], [int2(0, 0), int2(1, 2), int2(3, 2), int2(3, 0)], float2(2, 2))
let ptmo = PointMotion.init(v1: float2(2, -1), v2: float2(2, 4))

let cTime = collideTime(motion: ptmo, fixture: fix)
let collidePoint = ptmo.getPos(at: cTime)
print(cTime , " collide at ", collidePoint)
