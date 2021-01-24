//
//  Bundle+Extensions.swift
//  NSAbout
//
//  Created by hengyu on 2021/1/24.
//  Copyright © 2021 hengyu. All rights reserved.
//

import Foundation

public extension Bundle {
    var releaseVersionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }

    var appName: String? {
        infoDictionary?[kCFBundleNameKey as String] as? String
    }

    var copyright: String? {
        infoDictionary?["NSHumanReadableCopyright"] as? String
    }
}
