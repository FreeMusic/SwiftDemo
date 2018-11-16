//
//  HomeModel.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/14.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit
import HandyJSON

struct OutHomeModel: HandyJSON {
    
    var code:String!
    var msg:String!
    var data:MyData?
    
}

struct MyData: HandyJSON {
    var pc:String!
    var pi: Int?
    var ps: Int?
    var rows: [HomeModel]?
}

struct HomeModel: HandyJSON {
    var desc:String?
    var imgUrl:String?
    var nId:Int?
    var time:Int?
    var title:String?
    var url:String?
}
