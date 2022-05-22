# NSAbout

<img width=480 src="Images/example.png">

`NSAbout` is a super simple about window for macOS platform.

## Usage

```swift
let content = AboutContent(
    name: Bundle.main.appName ?? "USTCBot",
    version: "Version \(Bundle.main.releaseVersionNumber ?? "7.0")"
        + " (Build \(Bundle.main.buildVersionNumber ?? "2103"))",
    info: "Designed by Hengyu\nUniversity of Science and Technology of China",
    url: URL(string: "https://artlvr.com")
)

let aboutWindow = AboutWindowController(content: content)

aboutWindow.showWindow(nil)
```

## Installation

### Swift Package Manager

[NSAbout](https://github.com/hengyu/NSAbout.git) could be installed via [Swift Package Manager](https://www.swift.org/package-manager/). Open Xcode and go to **File** -> **Add Packages...**, search `https://github.com/hengyu/NSAbout.git`, and add the package as one of your project's dependency.

### Manual

1. Download code from [GitHub](https://github.com/Hengyu/NSAbout);
2. Drag & drop the `Sources` folder into your project.

## License

[NSAbout](https://github.com/Hengyu/NSAbout.git) is released under the [MIT License](LICENSE).
