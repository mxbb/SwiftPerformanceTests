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
    
    func testIntMap() {
        self.measure {
            _ = testDataInt.map() { print($0 * 2) }
        }
    }
    func testIntForEach() {
        self.measure {
            testDataInt.forEach() { print($0 * 2) }
        }
    }
    func testIntForIn() {
        self.measure {
            for i in testDataInt {
                print(i * 2)
            }
        }
    }
    
    // MARK - Double Tests
    
    func testDoubleMap() {
        self.measure {
            _ = testDataDouble.map() { print($0 * 2) }
        }
    }
    func testDoubleForEach() {
        self.measure {
            testDataDouble.forEach() { print($0 * 2) }
        }
    }
    func testDoubleForIn() {
        self.measure {
            for i in testDataDouble {
                print(i * 2)
            }
        }
    }

    // MARK - Conditions

    func testForInWhere() {
        self.measure {
            for i in testDataInt where i % 2 == 0 {
                print(i * 2)
            }
        }
    }
    func testForInIf() {
        self.measure {
            for i in testDataInt {
                if i % 2 == 0 {
                    print(i * 2)
                }
            }
        }
    }

}
