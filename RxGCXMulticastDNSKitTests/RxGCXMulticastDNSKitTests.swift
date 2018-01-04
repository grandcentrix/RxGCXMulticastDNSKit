//
//  RxGCXMulticastDNSKitTests.swift
//  RxGCXMulticastDNSKitTests
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

import XCTest
@testable import RxGCXMulticastDNSKit
import GCXMulticastDNSKit
import RxSwift

class RxGCXMulticastDNSKitTests: XCTestCase {
    
    var disposeBag: DisposeBag?
    var service: NetService?
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        disposeBag = nil
        service?.stop()
        service = nil
        super.tearDown()
    }
    
    func testSubscriptionWorksAndEmitsResults() {
        service = NetService(domain: "", type: "_http._tcp", name: "GCXDNSKitTest", port: 10000 )
        service?.publish()

        let configuration = DiscoveryConfiguration(serviceType: "_http._tcp", serviceNamePrefix: "GCXDNSKitTest")
        let expectation = self.expectation(description: "called")
        Discovery.rx.service(configurations: [ configuration ] ).subscribe(onNext: { result in
            expectation.fulfill()
        }).disposed(by: disposeBag!)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
}
