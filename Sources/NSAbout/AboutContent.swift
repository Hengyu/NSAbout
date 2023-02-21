//
//  MIT LICENSE
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021-2023 hengyu. All rights reserved.
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

#if canImport(Carbon) && os(macOS)
import Carbon
import Foundation

public struct AboutContent: Codable, Equatable, Sendable {
    public static let spaceKeyCode: Int = kVK_Space
    public static let escapeKeyCode: Int = kVK_Escape

    public let name: String
    public let version: String
    public let info: String
    public let url: URL?
    public let closeKeyCodes: [Int]

    public init(
        name: String,
        version: String,
        info: String,
        url: URL? = nil,
        closeKeyCodes: [Int] = [AboutContent.spaceKeyCode, AboutContent.escapeKeyCode]
    ) {
        self.name = name
        self.version = version
        self.info = info
        self.url = url
        self.closeKeyCodes = closeKeyCodes
    }
}
#endif
