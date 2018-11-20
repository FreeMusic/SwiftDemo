//
//  RYQWebViewVC+Progess.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/20.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation

/**
 RYQWebViewVC类扩展 主要处理 返回按钮  关闭按钮  监听进度条事件
 */
extension RYQWebViewVC {
    /**
     添加监听
     */
    func addObserverForWebView(){
        //添加监听
        self.wkWebView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: &myContext)
        self.wkWebView.addObserver(self, forKeyPath:  "estimatedProgress", options: NSKeyValueObservingOptions.new, context: &myContext)
    }
    /**
     创建返回按钮和关闭按钮
     */
    func createCloseButtonAndBackButton(){
        //返回按钮
        let backBtn = RYQButton.initButton(image: "backBlackIcon", action: #selector(backButtonClick), target: self)
        let backItem = UIBarButtonItem(customView: backBtn)
        //关闭按钮
        let closeBtn = RYQButton.initTextButton(title: "关闭", action: #selector(closeButtonClick), target: self, font: 28, style: RYQButton.TitleLabelFontStyle.system, backColor: RYQButton.ButtonBackGColor.clear)
        closeBtn.setTitleColor(black, for: UIControlState.normal)
        let closeItem = UIBarButtonItem(customView: closeBtn)
        
        self.navigationItem.leftBarButtonItems = [backItem, closeItem]
    }
    
    func backButtonClick(){
        if self.wkWebView.canGoBack {
            self.wkWebView.goBack()
        }else{
            self.closeButtonClick()
        }
    }
    
    func closeButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    /**
     观察者监听值的改变
     */
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            self.title = self.wkWebView.title;
        }else if keyPath == "estimatedProgress" {
            progressView?.isHidden = self.wkWebView.estimatedProgress == 1
            
            progressView?.setProgress(Float(self.wkWebView.estimatedProgress), animated: true)
            
            if(self.wkWebView.estimatedProgress >= 1.0) {
                progressView?.progress = 0
            }
        }
    }
}
