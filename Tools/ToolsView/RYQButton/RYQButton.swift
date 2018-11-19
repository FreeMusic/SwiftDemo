//
//  RYQButton.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/12.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class RYQButton: UIButton {
    
    /// TitleLabelFontStyle 枚举标题的字体类型
    ///
    /// - system: 系统字体类型
    /// - blod: 加粗字体类型
    enum TitleLabelFontStyle {
        case system
        case blod
    }
    
    /// ButtonBackGColor 按钮背景颜色
    ///
    /// - master: App主色调
    /// - clear: 透明色
    enum ButtonBackGColor {
        case master
        case clear
    }

    /// 图片按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮大小
    ///   - image: 按钮图片
    ///   - action: 按钮点击事件
    ///   - target: 按钮target
    class func initButton(frame:CGRect, image:String, action:Selector, target:Any) -> RYQButton {
        let button = RYQButton()
        
        button.frame = frame
        button.setImage(UIImage.init(named: image), for: UIControlState.normal)
        button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        return button
    }
    
    /// 文字按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮大小
    ///   - title: 按钮标题
    ///   - action: 按钮点击事件
    ///   - target: 按钮target
    ///   - font: 字体大小
    ///   - style: 字体类型
    ///   - backColor: 按钮背景颜色
    class func initTextButton(frame:CGRect, title:String, action:Selector, target:Any, font:Int, style:TitleLabelFontStyle, backColor:ButtonBackGColor) -> RYQButton {
        let button = RYQButton()
        button.frame = frame
        button.setTitle(title, for: UIControlState.normal)
        button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        button.swichTitleLabelFontStyle(font: font, style: style)
        button.swichTitleLabelBackGColor(backColor: backColor)
        
        return button
    }
    
    func swichTitleLabelFontStyle(font:Int, style:TitleLabelFontStyle){
        switch style {
        case TitleLabelFontStyle.system:do {
            self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(font)*m6Scale)
            }
            
        case TitleLabelFontStyle.blod:do {
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(font)*m6Scale)
            }
        default: break
            
        }
    }
    
    func swichTitleLabelBackGColor(backColor:ButtonBackGColor){
        switch backColor {
        case ButtonBackGColor.master:do{
            self.backgroundColor = red
        }
        
        case ButtonBackGColor.clear:do{
            self.backgroundColor = clear
        }
            
        default: break
            
        }
    }
    
    
    
}
