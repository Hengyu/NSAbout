//
//  AboutWindowController.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import AppKit
import Cocoa

public final class AboutWindowController: NSWindowController {
    public var url: URL?
    public var closeKeyCodes: [UInt16]?

    private var aboutView: AboutView = .init(frame: .zero)

    public init(content: AboutContent, style: AboutStyle = .standard) {
        let window = AboutWindow(style: style)
        window.contentView = aboutView
        super.init(window: window)
        setContent(content)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        windowFrameAutosaveName = AboutWindow.autosaveName
        aboutView.imageTapped = { [unowned self] in
            if let url = self.url {
                self.visitWebsite(url)
            }
        }
    }

    public func setContent(_ content: AboutContent) {
        aboutView.name = content.name
        aboutView.version = content.version
        aboutView.info = content.info
        url = content.url
        closeKeyCodes = content.closeKeyCodes
    }

    private func visitWebsite(_ url: URL) {
        NSWorkspace.shared.open(url)
    }

    public override func keyDown(with event: NSEvent) {
        guard let window = window, let closeKeyCodes = closeKeyCodes else { return }

        if closeKeyCodes.contains(event.keyCode) {
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 1
                window.animator().alphaValue = 0
            }, completionHandler: {
                self.close()
                window.alphaValue = 1
            })
        }
    }
}
