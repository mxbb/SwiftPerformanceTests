//
//  DummyStructure.swift
//  PerformanceTests
//
//  Created by mxbb on 10/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import Foundation

struct DummyStructure {
    var value = Int.random(in: -1000...1000)
    var isAdmin: Bool {
        return value % 10 < 6
    }
    var isOwner: Bool {
        return value % 2 == 0 && value > 0
    }

    static func generateData(_ count: Int) -> Array<DummyStructure> {
        var result: Array<DummyStructure> = []
        for _ in 1...count {
            result.append(DummyStructure())
        }
        return result
    }
}
