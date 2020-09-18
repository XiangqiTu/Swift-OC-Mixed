//
//  File.swift
//  MixedModule
//
//  Created by kk on 2020/9/18.
//

import Foundation

//1.同一个Module内可以直接引用

@objcMembers

public class MixHomeSwift : NSObject {
    public func mixHome() {
        
    }
    
    public override init() {
        let homeVC = HomeViewController()
        homeVC.logHomeViewController()
    }
}
