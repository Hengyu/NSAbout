//
//  NSAboutTests.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/23.
//  Copyright © 2021 hengyu. All rights reserved.
//

@testable import NSAbout
import XCTest

final class NSAboutTests: XCTestCase {
    func testAboutContent() {
        let content = AboutContent(name: "App Name", version: "1.0", info: "Designed by Hengyu")
        XCTAssertEqual(content.name, "App Name")
        XCTAssertEqual(content.version, "1.0")
        XCTAssertEqual(content.info, "Designed by Hengyu")
    }

    func testAboutStyle() {
        let style = AboutStyle.standard
        XCTAssertEqual(style.enablesWindowShadow, true)
    }

    static var allTests = [
        ("testAboutContent", testAboutContent),
        ("testAboutStyle", testAboutStyle)
    ]
}
