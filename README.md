# Hash2Pics

[![CI Status](https://img.shields.io/travis/Pidji/Hash2Pics.svg?style=flat)](https://travis-ci.org/Pidji/Hash2Pics)
[![Version](https://img.shields.io/cocoapods/v/Hash2Pics.svg?style=flat)](https://cocoapods.org/pods/Hash2Pics)
[![License](https://img.shields.io/cocoapods/l/Hash2Pics.svg?style=flat)](https://cocoapods.org/pods/Hash2Pics)
[![Platform](https://img.shields.io/cocoapods/p/Hash2Pics.svg?style=flat)](https://cocoapods.org/pods/Hash2Pics)

![](https://github.com/Pidji/Hash2Pics-IOS/tree/master/Example/Hash2Pics/hash2pics.gif)

## Requirements

| Target | Version |
| ------- | -------- |
| iOS     | => 8.0  |
|Swift    | => 4.1  |

## Installation

Hash2Pics is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Hash2Pics'
```

## Usage

Simply pass hash and diameter to create picture

```
let pic = PictureConstructor().createPicture(diameter: 200, seed: "YOUR_HASH")
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Authors

This library developed by guys from Multy - best open-source cryptocurrency wallet, team@multy.io

## License

Hash2Pics is available under the MIT license. See the LICENSE file for more info.
