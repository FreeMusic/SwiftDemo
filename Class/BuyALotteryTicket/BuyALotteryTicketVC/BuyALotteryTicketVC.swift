//
//  BuyALotteryTicketVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/6/26.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class BuyALotteryTicketVC: MyTableViewReFreshVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavigationBarHeight-kTabBarHeight)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: "MyTableViewCell")
        let model = self.dataSource[indexPath.row]
        cell.setMyHomeModel(model: model as! HomeModel)
        
        return cell
    }
    
    override func setUpData() {
        let localPara:[String:Any] = ["pageNumber":NSString.init(format: "%d", self.page)]
        NetWorkHelper.tool.requestMainViewControllerData(url: NewsList, params: localPara, success: { (data) in
            self.refreshTableView(withDataSource: data.list)
        }) { (error) in
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:HomeModel = self.dataSource[indexPath.row] as! HomeModel
        let webVC = RYQWebViewVC()
        webVC.url = model.url!
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
