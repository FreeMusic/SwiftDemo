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

        let navigationTitleAttribute : NSDictionary = NSDictionary(object: UIColor.black,forKey: NSForegroundColorAttributeName as NSCopying)
        self.navigationBar.titleTextAttributes = navigationTitleAttribute as! [AnyHashable: Any] as? [String : AnyObject]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count >= 1 {
            //自定义返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "backWhiteIcon"), style: UIBarButtonItemStyle.done, target: self, action: #selector(backClick))
//            viewController.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage.init(named: "backWhiteIcon"), style: UIBarButtonItemStyle.done, target: self, action: #selector(backClick)), animated: true)
            //隐藏BottomBar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backClick() {
        self.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
