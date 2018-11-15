//
//  HomeModel.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/14.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit
import HandyJSON

struct responseModel: HandyJSON {
    
    var data:[TagModel]?
    var error: Int!
}
struct TagModel: HandyJSON {
    
    var nickname: String?
    var vertical_src: String?
    var ranktype: String?
    var room_src: String?
    var cate_id: Int?
}

struct OutHomeModel: HandyJSON {
    
    var code:String!
    var msg:String!
    var data:MyData?
    
}

struct MyData: HandyJSON {
    var pc:String!
    var pi: Int?
    var ps: Int?
    var rows: String?
}

struct Rows: HandyJSON {
    var row: HomeModel?
}

struct HomeModel: HandyJSON {
    var desc:String?
    var imgUrl:String?
    var nId:Int?
    var time:Int?
    var title:String?
    var url:String?
}
