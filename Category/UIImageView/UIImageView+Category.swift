//
//  UIImageView+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/16.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    /**
     基于Kingfisher加载网络图片
     */
    func setImage(imageName:String) {
        if imageName.isEmpty {
            return;
        }
        self.kf.setImage(with: ImageResource(downloadURL: URL.init(string: imageName)!))
    }
    
    /**
     基于Kingfisher加载网络图片
     带有占位图
     */
    func setImageWithHolder(imageName:String, holder:String){
        if imageName.isEmpty {
            return;
        }
        self.kf.setImage(with: ImageResource(downloadURL: URL.init(string: imageName)!), placeholder: UIImage.init(named: holder), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
