//
//  SXYNetWork.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class SXYNetWork: NSObject {
    
    static let work = SXYNetWork()//单例
    let reachAble = SXYNetworkReachability.reachAbility.reachAble//网络状态
    let manager = Alamofire.SessionManager.default
    
    /**
     请求结果结构体
     success : 请求是否成功（请求已进入后台） true 成功  false 失败
     json : 请求到的json数据
     error : 请求是否报异常 并且没有 进入后台
     requestURL:请求的URL地址
     */
    struct RequestData {
        var success: Bool?
        var json:String?
        var error:Any
        var requestURL: String?
    }
    
    //请求完成后的闭包回调
    typealias complitionHandler = (RequestData) -> Void
    
    /**
     GET请求
     */
    func GetRequest(url: String, paramters:[String:Any], _ handler:@escaping complitionHandler) {
        
        if reachAble {
            manager.session.configuration.timeoutIntervalForRequest = 30
            //网络连接
            manager.request(ServicerIPAddress+url, method: .get, parameters: paramters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
                
                var requestJson:String?
                var requestSuccess:Bool?
                let requestURL = ServicerIPAddress+url
                
                if response.result.isSuccess {
                    
                    if let jsonString = response.result.value {
                        requestJson = jsonString
                        if let outHomeModel = JSONDeserializer<OutHomeModel>.deserializeFrom(json: jsonString){
                            
                            requestSuccess = (outHomeModel.code == "0000")
                            
                            if requestSuccess == false {
                                //提示
                                
                            }
                        }
                    }
                }
                
                let data = RequestData(success: requestSuccess,json:requestJson,error:response.result.error as Any,requestURL: requestURL)
                
                handler(data)
            }
        }else{
            //网络没有连接
            
        }
        
    }
    
    /**
     POST请求
     */
    func PostRequest(url: String, paramters:[String:Any] , _ handler:@escaping complitionHandler) {
        manager.session.configuration.timeoutIntervalForRequest = 30
        if reachAble {
            //网络连接
            manager.request(ServicerIPAddress+url, method: .post, parameters: paramters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
                
                var requestJson:String?
                var requestSuccess:Bool?
                let requestURL = ServicerIPAddress+url
                
                if response.result.isSuccess {
                    
                    if let jsonString = response.result.value {
                        requestJson = jsonString
                        
                        if let outHomeModel = JSONDeserializer<OutHomeModel>.deserializeFrom(json: jsonString){
                            
                            requestSuccess = (outHomeModel.code == "0000")
                            
                            if requestSuccess == false {
                                //提示
                            }
                        }
                    }
                    
                }
                
                let data = RequestData(success: requestSuccess,json:requestJson,error:response.result.error as Any,requestURL: requestURL)
                
                handler(data)
                
            }
        }else{
            //网络没有连接
            
        }
        
    }
    
}
