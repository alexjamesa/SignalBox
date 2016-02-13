//: Playground - noun: a place where people can play

import Cocoa
@testable import SignalBox

var str = "Hello, playground"

let testFilePath = NSBundle.mainBundle().pathForResource("testdata2", ofType: "txt")!

let newSignal = Signal(path: testFilePath, Fs: 1000)


func arrayFromContentsOfFileWithPath2(path: String) -> [Double]? {
    do {
        let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
        let stringArray = content.componentsSeparatedByString("\n").map{
            $0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        return stringArray.flatMap{Double($0)}
    } catch _ as NSError {
        return nil
    }
}


func arrayFromContentsOfFileWithPath3(path: String) -> [Double]? {
    do {
        let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
        let scanner = NSScanner(string: content)
        var doubleArray = [Double]()
        var value = 0.0
        while scanner.scanDouble(&value) {
            doubleArray.append(value)
        }
        return doubleArray
    } catch _ as NSError {
        return nil
    }
}

let x = arrayFromContentsOfFileWithPath3(testFilePath)




let contentData = NSFileManager.defaultManager().contentsAtPath(testFilePath)!
let y = NSString(data: contentData, encoding: NSUTF8StringEncoding)!.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
let p = y.map{Double($0)}

let oo = y.flatMap{Double($0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))}
//print(oo)

// the number of elements:
//let count = 1000 //contentData.length / sizeof(Double)
//let sizeof = contentData.length / count
//for i in 0..<16{
//    print(contentData)
//}
//
//// create array of appropriate length:
//var array = [Float](count: count, repeatedValue: 0)
//
//// copy bytes into array
//contentData.getBytes(&array, length:count * sizeof)
//
//print(array)
//

//let count = contentData.length / sizeof(Double)
//
//// create array of appropriate length:
//var array = [Float](count: count, repeatedValue: 0)
//
//// copy bytes into array
//contentData.getBytes(&array, length:count * sizeof(Float))
//
//print(array)

//
//let stringArray = y.componentsSeparatedByString("\n").map{
//    $0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//}
//stringArray.flatMap{Double($0)}
