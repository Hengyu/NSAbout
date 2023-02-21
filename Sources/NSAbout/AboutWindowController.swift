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

#if canImport(AppKit) && canImport(Cocoa) && os(macOS)
import AppKit
import Cocoa

public final class AboutWindowController: NSWindowController {
    public var url: URL?
    public var closeKeyCodes: [Int]?

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
            if let url = url {
                visitWebsite(url)
            }
        }

        // simple override `keyDown(with:)` will not working with escape key press,
        // use the `NSEvent.addLocalMonitorForEvents(matching:)` to solve the problem
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.keyDown(with: $0)
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

    private func keyDown(with event: NSEvent) -> NSEvent? {
        if closeKeyCodes?.contains(Int(event.keyCode)) == true {
            dismissWindow()
            return nil
        }
        return event
    }

    private func dismissWindow() {
        guard let window = window else { return }

        NSAnimationContext.runAnimationGroup { context in
            context.duration = 1
            window.animator().alphaValue = 0
        } completionHandler: {
            self.close()
            window.alphaValue = 1
        }
    }
}
#endif
