# NSAbout

<img width=480 src="Images/example.png">

## About

`NSAbout` provides a simple about window for macOS.

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

1. Add package dependency [NSAbout](https://github.com/Hengyu/NSAbout.git) into your project;
2. Import `NSAbout` module in your code.

### Manual

1. Download code from [GitHub](https://github.com/Hengyu/NSAbout);
2. Drag & drop the `Sources` folder into your project.
