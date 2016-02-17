//
//  Signal.swift
//  SignalBox
//
//  Created by Alex Andrews on 160213.
//  Copyright © 2016 Ten Kettles Inc. All rights reserved.
//

import Foundation

struct Signal{
    
    let data:[Double]
    let Fs:Double
    
    init(data:[Double], Fs: Double){
        self.data = data
        self.Fs = Fs
    }
    
    init(path:String, Fs: Double){
        if let data = arrayFromContentsOfFileWithPath(path){
            self.init(data:data, Fs:Fs)
        }else{
            self.init(data:[1], Fs:Fs)
        }
        
    }
    
    var time:[Double] {
        let indices = Array(0.stride(to:data.count, by:1))
        return indices.map{ Double($0)/Fs }
    }
    
    var max:Double{
        return data.maxElement()!
    }
    
    var min:Double{
        return data.minElement()!
    }
}

func arrayFromContentsOfFileWithPath(path: String) -> [Double]? {
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

