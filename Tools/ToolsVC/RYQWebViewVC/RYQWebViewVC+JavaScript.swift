//
//  RYQWebViewVC+JavaScript.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/20.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import WebKit
import JavaScriptCore

/**
 RYQWebViewVC分类  主要处理和JS交互的部分 WKWebView加载
 */
extension RYQWebViewVC {
    /**
     添加注入js方法, swift与js端对应实现
     最后我们创建的代理要在控制器的-deinit方法中销毁.（相当于Objective-C中的dealloc）
     */
    func registerJSMethod(){
        self.wkWebView.configuration.userContentController.add(self, name: "JSMethodName")
    }
    /**
     webView开始加载
     */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //和JS交互的时候一般 已知JS方法名，但是JS方法没有回调回来参数的时候 使用此方法和JS实现交互
        webView.evaluateJavaScript("JSMethod") { (objc, error) in
            
        }
    }
    /**
     webView加载完毕
     */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    /**
     webView加载失败
     */
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        RYQLog(error)
    }
    /**
     webView关闭
     */
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    /**
     和JS交互的时候一般 已知JS方法名，JS方法有回调回来参数的时候 使用此方法和JS实现交互
     message 参数里面 有方法名和参数 可与前端自定义好结构 实现交互
     */
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let bodyParam = message.body as! NSDictionary
        RYQLog(bodyParam)
    }
    
}
