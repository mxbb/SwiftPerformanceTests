//
//  PerformanceTests.swift
//  PerformanceTests
//
//  Created by Maxim on 09/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import XCTest
@testable import Performance

var maxIteration = 1000

class PerformanceTests: XCTestCase {
    var testDataInt = Array(1...maxIteration)
    var testDataDouble = Array(stride(from: 1.0, through: Double(maxIteration), by: 0.5))
    var testDummyObjects = DummyClass.generateData(maxIteration)
    var testDummyStructs = DummyStructure.generateData(maxIteration)

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

    // MARK - Filter/Drop

    func testForFilter() { // 0.053 - 0.072 - 0.124
        self.measure {
            let filter = testDataInt.filter { $0 % 2 == 0 }
            print(filter)
        }
    }
    
    func testForDrop() {  // 0.641 - 0.121 - 0.153
        self.measure {
            let drop = testDataInt.drop { $0 % 2 != 0 }
            print(drop)
        }
    }

    func testForFilterClass() { //0.701
        self.measure {
            let filter = testDummyObjects.filter { $0.isAdmin || $0.isOwner }
            print(filter)
        }
    }
    func testForDropClass() { //1.042
        self.measure {
            let drop = testDummyObjects.drop { !$0.isAdmin && !$0.isOwner }
            print(drop)
        }
    }

    func testForFilterStruct() { //1.942
        self.measure {
            let filter = testDummyStructs.filter { $0.isAdmin || $0.isOwner }
            print(filter)
        }
    }
    func testForDropStruct() {  //2.242
        self.measure {
            let drop = testDummyStructs.drop { !$0.isAdmin && !$0.isOwner }
            print(drop)
        }
    }


}
