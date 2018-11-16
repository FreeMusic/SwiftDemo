//
//  NetWorkHelper+HomeVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/16.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import HandyJSON

extension NetWorkHelper {
    /**
     首页
     */
    func requestMainViewControllerData(url:String, params: [String:Any], success:@escaping successHandler, faile:@escaping failHandler){
        SXYNetWork.work.GetRequest(url: url, paramters: params) { (requestData) in
            
            if let outHomeModel = JSONDeserializer<OutHomeModel>.deserializeFrom(json: requestData.json){
                let myDataModel = outHomeModel.data
                myDataModel?.rows?.forEach({ (model) in
                    self.dataSource.append(model as Any)
                })
            }
            
            let aResult = Result(model:self.model as Any, list: self.dataSource)
            success(aResult)
            faile(requestData.error)
        }
    }
}
