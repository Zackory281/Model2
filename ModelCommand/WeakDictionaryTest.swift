//
//  WeakDictionaryTest.swift
//  Model2Tests
//
//  Created by Zackory Cramer on 11/30/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//

import XCTest

class WeakDictionaryTest: XCTestCase {

	class O {
		let i: Int
		init(_ n: Int) {
			i = n
		}
	}
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let dict = WeakDictionary<Int, O>()
		dict.insert(key: 0, obj: O(0))
		//XCTAssertEqual(dict.get, <#T##expression2: Equatable##Equatable#>)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
