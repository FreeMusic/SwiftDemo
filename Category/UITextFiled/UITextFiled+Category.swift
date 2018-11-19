//
//  UITextFiled+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/19.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation

private var placeKey:Void?

extension UITextField {
    
    var placeColor:UIColor {
        
        get {
            return objc_getAssociatedObject(self, &placeKey) as! UIColor
        }
        
        set(placeColor) {
            objc_setAssociatedObject(self, &placeKey, placeColor, objc_AssociationPolicy(rawValue: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN.rawValue)!)
            // 获取占位文字label控件
            let placeholderLabel = self.value(forKey: "placeholderLabel") as! UILabel
            // 设置占位文字颜色
            placeholderLabel.textColor = placeColor
        }
        
    }
    
    class func initTextFiled(placeHolder:String, addView:UIView) -> UITextField {
        let filed = UITextField.init()
        filed.placeholder = placeHolder
        addView.addSubview(filed)
        filed.placeColor = UIColor.gray
        
        return filed
    }
}
