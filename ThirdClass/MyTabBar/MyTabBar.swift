//
//  MyTabBar.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController {
    
    class func MyTabBar() -> UITabBarController {
        let tabBarVC = UITabBarController()
        //彩票
        let homeVC = BuyALotteryTicketVC()
        //消息
        let hotSpotVC = MessageVC()
        //订单
        let ticketOrderVC = TicketOrderVC()
        //个人中心
        let myCenterVC = MyCenterVC()
        //彩票导航控制器
        let homeNavi = MyNavigation.init(rootViewController: homeVC)
        //消息导航控制器
        let hotSpotNavi = MyNavigation.init(rootViewController: hotSpotVC)
        //会员导航控制器
        let vipNavi = MyNavigation.init(rootViewController: ticketOrderVC)
        //个人中心
        let myCenterNavi = MyNavigation.init(rootViewController: myCenterVC)
        
        let homeTabBarItem = UITabBarItem.init(title: "首页", image: (MyPublic.getImgView("home_tab_home_btn")), selectedImage: (MyPublic.getImgView("home_tab_home_selected_btn")))
        let hotSpotTabBarItem = UITabBarItem.init(title: "热点", image: (MyPublic.getImgView("home_tab_saunter_btn")), selectedImage: (MyPublic.getImgView("home_tab_saunter_selected_btn")))
        
        let vipTabBarItem = UITabBarItem.init(title: "会员", image: (MyPublic.getImgView("home_tab_branc_btn")), selectedImage: (MyPublic.getImgView("home_tab_branc_selected_btn")))
        let myCenterTabBarItem = UITabBarItem.init(title: "个人中心", image: (MyPublic.getImgView("home_tab_personal_btn")), selectedImage: (MyPublic.getImgView("home_tab_personal_selected_btn")))
        homeNavi.tabBarItem = homeTabBarItem
        hotSpotNavi.tabBarItem = hotSpotTabBarItem
        vipNavi.tabBarItem = vipTabBarItem
        myCenterNavi.tabBarItem = myCenterTabBarItem
        
        tabBarVC.tabBar.tintColor = red
        tabBarVC.viewControllers = [homeNavi, hotSpotNavi, vipNavi, myCenterNavi]
        
        return tabBarVC;
    }
    
    // 创建子控制器
    func addOneChildViewController(_ childVC:UIViewController, title:String, imageName:String, selectedImageName:String) {
        
        childVC.title = title;
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let nav = MyNavigation(rootViewController:childVC)
        self.addChildViewController(nav)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
