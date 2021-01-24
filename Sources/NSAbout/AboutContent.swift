//
//  AboutContent.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import Foundation

public struct AboutContent {

    public static let spaceKeyCode: UInt16 = 0x31
    public static let escapeKeyCode: UInt16 = 0x35

    public let name: String
    public let version: String
    public let info: String
    public let url: URL?
    public let closeKeyCodes: [UInt16]

    public init(
        name: String,
        version: String,
        info: String,
        url: URL? = nil,
        closeKeyCodes: [UInt16] = [AboutContent.spaceKeyCode, AboutContent.escapeKeyCode]
    ) {
        self.name = name
        self.version = version
        self.info = info
        self.url = url
        self.closeKeyCodes = closeKeyCodes
    }
}
