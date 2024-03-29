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

#if canImport(AppKit) && os(macOS)
import AppKit

public final class AboutView: NSView {

    public var name: String {
        get { nameLabel.stringValue }
        set { nameLabel.stringValue = newValue }
    }

    public var version: String {
        get { versionLabel.stringValue }
        set { versionLabel.stringValue = newValue }
    }

    public var info: String {
        get { infoLabel.stringValue }
        set { infoLabel.stringValue = newValue }
    }

    public var imageTapped: (() -> Void)?

    private let visualEffectView: NSVisualEffectView = .init(frame: .zero)
    private let stackView: NSStackView = .init(frame: .zero)
    private let textsContainer: NSStackView = .init(frame: .zero)
    private let topContainer: NSStackView = .init(frame: .zero)
    private let imageButton: NSButton = .init(frame: .zero)
    private let nameLabel: NSTextField = .init()
    private let versionLabel: NSTextField = .init()
    private let infoLabel: NSTextField = .init()

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupComponents()
        setupConstraints()
    }

    private func setupComponents() {
        visualEffectView.material = .hudWindow
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.state = .followsWindowActiveState
        addSubview(visualEffectView)

        imageButton.target = self
        imageButton.action = #selector(imageButtonClicked(_:))
        imageButton.bezelStyle = .inline
        imageButton.setButtonType(.toggle)
        imageButton.title = ""
        imageButton.isBordered = false
        imageButton.isTransparent = false
        imageButton.imageScaling = .scaleProportionallyUpOrDown
        imageButton.imagePosition = .imageOverlaps
        NSImage(named: NSImage.applicationIconName).map { imageButton.image = $0 }

        nameLabel.font = .systemFont(ofSize: 36, weight: .light)
        versionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        if #available(OSX 11.0, *) {
            infoLabel.font = .preferredFont(forTextStyle: .caption2, options: [:])
        }
        nameLabel.textColor = .controlTextColor
        nameLabel.isEditable = false
        nameLabel.backgroundColor = .clear
        nameLabel.drawsBackground = false
        nameLabel.isBezeled = false
        nameLabel.isBordered = false
        versionLabel.textColor = .controlTextColor
        versionLabel.isEditable = false
        versionLabel.backgroundColor = .clear
        versionLabel.drawsBackground = false
        versionLabel.isBezeled = false
        versionLabel.isBordered = false
        infoLabel.textColor = .tertiaryLabelColor
        infoLabel.isEditable = false
        infoLabel.backgroundColor = .clear
        infoLabel.drawsBackground = false
        infoLabel.isBezeled = false
        infoLabel.isBordered = false
        infoLabel.maximumNumberOfLines = 3
        infoLabel.preferredMaxLayoutWidth = 320

        topContainer.orientation = .vertical
        topContainer.alignment = .leading
        topContainer.distribution = .fill
        topContainer.spacing = 4
        topContainer.addArrangedSubview(nameLabel)
        topContainer.addArrangedSubview(versionLabel)

        textsContainer.orientation = .vertical
        textsContainer.alignment = .leading
        textsContainer.distribution = .equalSpacing
        textsContainer.setHuggingPriority(.required, for: .vertical)
        textsContainer.spacing = 36
        textsContainer.addArrangedSubview(topContainer)
        textsContainer.addArrangedSubview(infoLabel)

        stackView.orientation = .horizontal
        stackView.alignment = .centerY
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.addArrangedSubview(imageButton)
        stackView.addArrangedSubview(textsContainer)
        addSubview(stackView)
    }

    private func setupConstraints() {
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        imageButton.widthAnchor.constraint(equalTo: imageButton.heightAnchor).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 136).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        if #available(OSX 11.0, *) {
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        } else {
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        }
    }

    @objc
    private func imageButtonClicked(_ sender: NSButton) {
        imageTapped?()
    }
}
#endif
