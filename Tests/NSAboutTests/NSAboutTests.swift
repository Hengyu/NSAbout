//  MIT License
//
//  Copyright (c) 2021-2023 hengyu
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#if os(macOS)
@testable import NSAbout
import XCTest

final class NSAboutTests: XCTestCase {
    func testAboutContent() {
        let content = AboutContent(name: "App Name", version: "1.0", info: "Designed by Hengyu", closeKeyCodes: [0x31, 0x35])
        XCTAssertEqual(content.name, "App Name")
        XCTAssertEqual(content.version, "1.0")
        XCTAssertEqual(content.info, "Designed by Hengyu")
        XCTAssertEqual(content.closeKeyCodes, [0x31, 0x35])
    }

    func testAboutStyle() {
        let style = AboutStyle.standard
        XCTAssertEqual(style.enablesWindowShadow, true)
    }
}
#endif
