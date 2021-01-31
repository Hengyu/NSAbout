//
//  AboutStyle.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import Foundation

public struct AboutStyle {

    public var enablesWindowShadow: Bool = true
    #if os(macOS)
    public var windowRect: NSRect = .init(
        origin: CGPoint(x: 600, y: 500),
        size: CGSize(width: 480, height: 160)
    )
    #endif

    public static let standard: AboutStyle = .init()

    private init() { }
}
