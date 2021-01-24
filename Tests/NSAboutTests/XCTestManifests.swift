//
//  XCTestManifests.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/23.
//  Copyright © 2021 hengyu. All rights reserved.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(NSAboutTests.allTests)
    ]
}
#endif
