//
//  DummyClass.swift
//  PerformanceTests
//
//  Created by mxbb on 10/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import Foundation

class DummyClass {
    var value = Int.random(in: -1000...1000)
    var isAdmin: Bool {
        return value % 10 < 6
    }
    var isOwner: Bool {
        return value % 2 == 0 && value > 0
    }

    static func generateData(_ count: Int) -> Array<DummyClass> {
        var result: Array<DummyClass> = []
        for _ in 1...count {
            result.append(DummyClass())
        }
        return result
    }
}
