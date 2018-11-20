//
//  MyNavigation.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        //设置设置title颜色字体
        let dic = [NSFontAttributeName:UIFont.systemFont(ofSize: 18.0),NSForegroundColorAttributeName:black]
        self.navigationBar.titleTextAttributes = dic
        //设置bar背景颜色
        self.navigationBar.barTintColor = white
    }
    /**
     *  重写push方法的目的 : 拦截所有push进来的子控制器
     *
     *  @param viewController 刚刚push进来的子控制器
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            //统一设置bar背景颜色
            //            self.navigationBar.barTintColor  = #colorLiteral(red: 0.9176470588, green: 0.2431372549, blue: 0.3098039216, alpha: 1)
            //统一设置返回按钮样式
            let backBtn = UIButton(type: .custom)
            backBtn.setImage(UIImage(named: "backBlackIcon"), for: .normal)
            backBtn.sizeToFit()
            backBtn.addTarget(self, action:  #selector(back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    
    func back()  {
        
        _ = self.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
