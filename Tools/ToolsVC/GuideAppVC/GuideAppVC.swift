//
//  GuideAppVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/12.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class GuideAppVC: BaseViewController {
    
    var guideArray = ["GuideAppImgView1", "GuideAppImgView2", "GuideAppImgView3"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //滑动公示图
        let scrollView = UIScrollView.init()
        self.view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize.init(width: kScreenWidth*CGFloat(guideArray.count), height: kScreenHeight)
        scrollView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        
        //在遍历数组的时候，Swift还提供了一种特别方便的方式（利用元祖）
        for (index,value) in guideArray.enumerated() {
            let imgView = UIImageView.init(image: UIImage.init(named: value))
            scrollView.addSubview(imgView)
            imgView.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize.init(width: kScreenWidth, height: kScreenHeight))
                make.left.equalTo(kScreenWidth*CGFloat(index))
                make.top.equalTo(0)
            }
            if index == guideArray.count-1 {
                let tapOne = UITapGestureRecognizer(target: self, action: #selector(tapClick))
                imgView.isUserInteractionEnabled = true
                imgView.addGestureRecognizer(tapOne)
            }
        }
    }
    
    @objc func tapClick() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        app.changeAppRootVC()
    }
}
