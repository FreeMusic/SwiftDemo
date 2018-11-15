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
        var res_data:[String:Any]?
        var list:Array<Any>
    }
    
    var localPara:[String:Any] = ["pageNumber":"1"]
    //首页
    func requestMainViewControllerData(url:String, params: [String:Any], _ comp:@escaping ((result) -> Void)){
        
        Alamofire.request(ServicerIPAddress+url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            
            if response.result.isSuccess {
                
                if let jsonString = response.result.value {
                    let dic = self.getDictionaryFromJSONString(jsonString: jsonString)
                    RYQLog(dic)
                }
            }
        }
    }
    
    /**
     json转字典
     */
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}
