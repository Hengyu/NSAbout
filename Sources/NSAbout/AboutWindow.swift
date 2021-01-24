//
//  AboutWindow.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import AppKit

final class AboutWindow: NSWindow {

    static let autosaveName: NSWindow.FrameAutosaveName = "AboutWindow"

    init(style: AboutStyle) {
        super.init(
            contentRect: style.windowRect,
            styleMask: [.closable, .titled, .fullSizeContentView],
            backing: .buffered,
            defer: true
        )

        hasShadow = style.enablesWindowShadow
        isRestorable = true
        titlebarAppearsTransparent = true
        isReleasedWhenClosed = true
    }
}
