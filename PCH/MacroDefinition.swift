//
//  MacroDefinition.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width//屏幕宽
let kScreenHeight = UIScreen.main.bounds.size.height//屏幕高
/**
 *  比例系数适配  宽度比例系数
 */
let m6PScale = kScreenWidth/1242.0
let m6Scale = kScreenWidth/750.0
let m5Scale = kScreenWidth/640.0
let m6HeightScale = kScreenHeight/1334.0
/**
 颜色
 */
let red = UIColor.red
let black = UIColor.black
let white = UIColor.white
let clear = UIColor.clear
//电池栏
var kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
//导航栏
var kNavBarHeight:CGFloat! = 44
//tabbar高度
var kTabBarHeight:CGFloat! = (kStatusBarHeight > 20) ? 83.0 : 49.0
//导航+电池栏
var NavigationBarHeight:CGFloat! = kStatusBarHeight+kNavBarHeight
//安全区底部高度
var KSafeBarHeight:CGFloat! = (kStatusBarHeight > 20) ? 34.0 : 0
//用户是否第一次进入App
var UserIsFirstApp = "UserIsFirstSkipToApp"
//存储本地数据类型
var saveDefaults = UserDefaults.standard
//灰色背景色
var BackGroundColor = UIColor.init(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0/255.0, alpha: 1.0)




