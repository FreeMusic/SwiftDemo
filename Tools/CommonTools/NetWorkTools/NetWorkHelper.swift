//
//  NetWorkHelper.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import Foundation
import HandyJSON

enum MethodType {
    case GET
    case POST
}

class NetWorkHelper: NSObject {
    
    static let tool = NetWorkHelper()
    
    struct result {
        var data:[String:Any]?
        var list:Array<Any>
    }

    //首页
    func requestMainViewControllerData(url:String, params: [String:Any], _ comp:@escaping ((result) -> Void)){
        
        SXYNetWork.work.GetRequest(url: url, paramters: params) { (requestData) in
            var dataSource = [Any]()
            let data = Factory.getDictionaryFromJSONString(jsonString: requestData.json!)
            
            if let outHomeModel = JSONDeserializer<OutHomeModel>.deserializeFrom(json: requestData.json){
                let myDataModel = outHomeModel.data
                myDataModel?.rows?.forEach({ (model) in
                    dataSource.append(model as Any)
                })
            }
            let aResult = result(data:data as? [String : Any] , list: dataSource)
            comp(aResult)
        }
    }

}
