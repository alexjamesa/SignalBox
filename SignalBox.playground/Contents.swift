//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground
@testable import SignalBox

let testFilePath = NSBundle.mainBundle().pathForResource("testdata2", ofType: "txt")!

let newSignal = Signal(path: testFilePath, Fs: 1000)
newSignal.data

func plotArrayInPlayground<T>(arrayToPlot:Array<T>, title:String) {
    for currentValue in arrayToPlot {
        XCPCaptureValue(title, value: currentValue)
    }
}

plotArrayInPlayground(newSignal.data, title: "Noise")






