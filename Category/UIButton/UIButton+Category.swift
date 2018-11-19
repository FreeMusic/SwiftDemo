//
//  UIButton+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/19.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation


/// RYQButtonBackColor 按钮背景色
///
/// - mainColor: 主色调
enum RYQButtonBackColor {
    case mainColor
}

private var colorKey: Void?//颜色
private var actionKey: Void?//点击事件
/**
 按钮的点击事件闭包
 */
typealias buttonAction = (UIButton) -> Void

extension UIButton {
    /**
     runtime 为button添加color属性
     */
    var color:RYQButtonBackColor{
        
        get {
            return (objc_getAssociatedObject(self, &colorKey) as? RYQButtonBackColor)!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &colorKey, newValue, objc_AssociationPolicy(rawValue: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN.rawValue)!)
            //color属性的赋值判断
            self.setColor(color: newValue)
        }
    }
    /**
     color属性的赋值判断
     */
    func setColor(color:RYQButtonBackColor) {
        switch color {
        case .mainColor:
            self.backgroundColor = UIColor.red
        default: break
            
        }
    }
    /**
     文字按钮的创建
     */
    class func initButton(title:String, radius:CGFloat,color:RYQButtonBackColor, addView:UIView, action:buttonAction) -> UIButton {
        let button = UIButton()
        button.color = color
        button.setTitle(title, for: UIControlState.normal)
        button.layer.cornerRadius = radius*m6Scale
        button.layer.masksToBounds = true
        button.adjustsImageWhenHighlighted = false
        addView.addSubview(button)
        
        objc_setAssociatedObject(button, &actionKey, action, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        button.addTarget(button, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }
    /**
     图片按钮的创建
     */
    class func initImageButton(imageName:String, addView:UIView, action:buttonAction) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        button.adjustsImageWhenHighlighted = false
        addView.addSubview(button)
        
        objc_setAssociatedObject(button, &actionKey, action, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        button.addTarget(button, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }
    /**
     按钮的点击事件
     */
    func buttonClick(sender:UIButton) -> Void {
        let action:buttonAction = objc_getAssociatedObject(sender, &actionKey) as! buttonAction
        action(sender)
    }
    
}
