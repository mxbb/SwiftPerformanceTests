//
//  PerformanceTests.swift
//  PerformanceTests
//
//  Created by Maxim on 09/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import XCTest
@testable import Performance

class PerformanceTests: XCTestCase {
    var testDataInt = Array(1...1000)
    var testDataDouble = Array(stride(from: 1.0, through: 10000.0, by: 0.5))

    // MARK - Int Tests
    
    func testIntMap() { // 0.06
        self.measure {
            _ = testDataInt.map() { print($0 * 2) }
        }
    }
    func testIntForEach() { //0.04
        self.measure {
            testDataInt.forEach() { print($0 * 2) }
        }
    }
    func testIntForIn() { //0.05
        self.measure {
            for i in testDataInt {
                print(i * 2)
            }
        }
    }
    
    // MARK - Double Tests
    
    func testDoubleMap() { //0.615
        self.measure {
            _ = testDataDouble.map() { print($0 * 2) }
        }
    }
    func testDoubleForEach() { //0.462
        self.measure {
            testDataDouble.forEach() { print($0 * 2) }
        }
    }
    func testDoubleForIn() { //1.265
        self.measure {
            for i in testDataDouble {
                print(i * 2)
            }
        }
    }

    // MARK - Conditions

    func testForInWhere() { //0.023
        self.measure {
            for i in testDataInt where i % 2 == 0 {
                print(i * 2)
            }
        }
    }
    func testForInIf() {  //0.486
        self.measure {
            for i in testDataInt {
                if i % 2 == 0 {
                    print(i * 2)
                }
            }
        }
    }

    // MARK - Filter/Drop/Findf irst

}
