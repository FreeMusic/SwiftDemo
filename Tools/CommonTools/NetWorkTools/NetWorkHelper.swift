//
//  NetWorkHelper.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class NetWorkHelper: NSObject {
    
    static let tool = NetWorkHelper()
    /**
     请求结果
     */
    struct Result {
        var model:Any
        var list:Array<Any>
    }
    
    //请求成功后的闭包回调
    typealias successHandler = (Result) -> Void
    //请求失败后的闭包回调
    typealias failHandler = (Any) -> Void
}
