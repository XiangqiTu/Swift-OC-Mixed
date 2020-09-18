//
//  File.swift
//  MixedModule
//
//  Created by kk on 2020/9/18.
//

import Foundation

import MixedModule

//不能与OCModule 相互引用，OCModule依赖SwiftModule
//import OCModule

@objcMembers

public class SwiftController : NSObject {
    public let swiftProperty = "swiftProperty";
    public func swiftLog() {
        print("swiftLog");
    }
    
    public override init() {
        let mixController = HomeViewController()
        mixController.logHomeViewController()
        
        let mixHomeSwift = MixHomeSwift()
        mixHomeSwift.mixHome()
    }
}
