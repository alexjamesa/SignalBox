//
//  SignalBoxTests.swift
//  SignalBoxTests
//
//  Created by U3 on 160213.
//  Copyright © 2016 Ten Kettles Inc. All rights reserved.
//

import XCTest
@testable import SignalBox

class SignalBoxTests: XCTestCase {
    
    var testSignal:Signal = Signal(data: [1,2,3,2,1], Fs: 1000.0)
    let pathOfBigData = "/Users/U3/U3 Data/4V. My Folders/Engineer/Ten Kettles/Apps/Misc./SignalBox/testdata.txt"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFileLoadSize(){
        let signalFromText = Signal(path: pathOfBigData, Fs: 1000)
        let value = signalFromText.data.count
        XCTAssert(value == 10000, "Value was \(value)")
    }
    
    func testFileLoadContent(){
        let signalFromText = Signal(path: pathOfBigData, Fs: 1000)
        let value = signalFromText.data[3]
        XCTAssert(abs(value - 0.9134) < 0.001, "Value was \(value)")
    }
    
    func testTime() {
        let value = testSignal.time[1]
        XCTAssert(value == 0.001, "Value was \(value)")
    }
    
    func testMax(){
        let value = testSignal.max
        XCTAssert(value == 3, "Value was \(value)")
        
    }
    
    func testPerformanceExample() {
        self.measureBlock {
            for _ in 0..<100{
                _ = Signal(path: self.pathOfBigData, Fs: 1000)
            }
        }
    }
    
}
