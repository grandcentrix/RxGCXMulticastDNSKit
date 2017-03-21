//
//  Dicovery+Rx.swift
//  RxGCXMulticastDNSKit
//
//  Copyright 2017 grandcentrix GmbH
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation
import GCXMulticastDNSKit

#if !RX_NO_MODULE
    import RxSwift
#endif

public enum DiscoveryResult {
    case serviceFound(DiscoveryService)
    case failure(DiscoveryConfiguration, DiscoveryError)
    case serviceRemoved(DiscoveryService)
}

extension Reactive where Base: Discovery {
    
    
    /// Creates a new observable that emits services with the passed configurtions.
    /// The observable never calles onCompleted or onError. To stop searching you have to
    /// dispose the observable.
    ///
    /// - Parameter configurations: the configurations to search services for
    /// - Returns: an observanle that emits DiscoveryResults
    public static func service(configurations: [DiscoveryConfiguration]) -> Observable<DiscoveryResult> {
        return Observable.create { observer in
            let discovery = Discovery(with: configurations, discoverHandler: { (service) in
                observer.onNext(.serviceFound(service))
            }, failHandler: { (configuration, error) in
                observer.onNext(.failure(configuration, error))
            }, serviceRemovedHandler: { (service) in
                observer.onNext(.serviceRemoved(service))
            })
            
            discovery?.startDiscovery()
            
            return Disposables.create {
                discovery?.stopDiscovery()
            }
        }
    }
}
