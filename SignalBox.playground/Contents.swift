//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground
@testable import SignalBox

// A helper function for easy plotting
func plotArrayInPlayground<T>(arrayToPlot:Array<T>, title:String) {
    for currentValue in arrayToPlot {
        XCPCaptureValue(title, value: currentValue)
    }
}


let testFilePath = NSBundle.mainBundle().pathForResource("testdata_1k", ofType: "txt")!
let signalFromFile = Signal(path: testFilePath, Fs: 1000)
signalFromFile.data
plotArrayInPlayground(signalFromFile.data, title: "From file")


let signalFromArray = Signal(data: [1,4,3], Fs: 100)
signalFromArray.data
plotArrayInPlayground(signalFromArray.data, title: "From data")






