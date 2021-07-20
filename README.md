# RxGCXMulticastDNSKit
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Release](https://img.shields.io/github/release/grandcentrix/RxGCXMulticastDNSKit.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Cocoapods compatible](https://img.shields.io/cocoapods/v/RxGCXMulticastDNSKit.svg)](https://cocoapods.org/)
[![badge-swiftpm]][swiftpm]

This is a simple RxSwift wrapper for GCXMulticastDNSKit.

## Requirements

[RxSwift](https://github.com/ReactiveX/RxSwift) @ v6.x [GCXMulticastDNSKit](https://github.com/grandcentrix/GCXMulticastDNSKit) @ v1.4.0

## Usage
```swift
public enum DiscoveryResult {
    case serviceFound(DiscoveryService)
    case failure(DiscoveryConfiguration, DiscoveryError)
    case serviceRemoved(DiscoveryService)
}
```

```swift
let disposeBag = DisposeBag()

...

let configuration = DiscoveryConfiguration(serviceType: "_http._tcp", serviceNamePrefix: "GCXDNSKitTest")
Discovery.rx.service(configurations: [ configuration ] ).subscribe(onNext: { result in
	  switch (result) {
            case .failure(let configuration, let error):
            	// handle the error
                break
            case .serviceFound(let service):
            	// we got a service
                break
            case .serviceRemoved(let service):
            	// a service disappeared
                break
            }
    }).addDisposableTo(disposeBag)

```

## Installation

### Swift Package Manager

Add the following entry to your package's dependencies:

```
.Package(url: "https://github.com/grandcentrix/RxGCXMulticastDNSKit.git", .upToNextMajor(from: "1.4.0")))
```

### Carthage
```ruby
git "https://github.com/grandcentrix/RxGCXMulticastDNSKit.git"

```

### Cocoapods

```ruby
use_frameworks!

pod 'RxGCXMulticastDNSKit'

```

## License

```
Copyright 2017 grandcentrix GmbH

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
