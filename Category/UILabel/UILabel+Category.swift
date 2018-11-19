//
//  UILabel+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import UIKit

private var labelActionKey: Void?//可点击标签

/**
 label的点击手势事件闭包
 */
typealias labelAction = () -> Void

extension UILabel {
    /**
     UILabel  添加分类
     color  字体颜色
     font  字体大小
     text  label字体
     subView 父视图
     */
    convenience init(color: UIColor, font: CGFloat, text: String, subView:UIView){
        self.init()
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: font)
        subView.addSubview(self)
    }
    /**
     UILabel  添加分类
     color  字体颜色
     font  字体大小
     text  label字体
     subView 父视图
     action 点击事件
     */
    class func initLabel (color: UIColor, font: CGFloat, text: String, subView:UIView, action:labelAction) -> UILabel {
        
        let label = UILabel.init()
        
        label.text = text
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: font)
        subView.addSubview(label)
        label.isUserInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer.init(target: label, action: #selector(labelClick(tap:)))
        label.addGestureRecognizer(tap)
        objc_setAssociatedObject(tap, &labelActionKey, action, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        
        return label
    }
    
    /**
     按钮的点击事件
     */
    func labelClick(tap: UITapGestureRecognizer) -> Void {
        let action = objc_getAssociatedObject(tap, &labelActionKey) as! labelAction
        action()
    }
}
