//
//  AboutContent.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import Carbon.HIToolbox
import Foundation

public struct AboutContent {

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
