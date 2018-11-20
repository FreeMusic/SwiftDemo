//
//  RYQWebViewVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/12.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit
import WebKit

var myContext = 0

class RYQWebViewVC: BaseViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {
    
    var url:String = ""//链接
    var wkWebView = WKWebView()//网页
    var progressView: UIProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "新闻资讯"
        wkWebView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavigationBarHeight)
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
        self.view.addSubview(wkWebView)
        //进度条
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 2))
        progressView?.trackTintColor = UIColor.white
        progressView?.progressTintColor = UIColor.orange
        self.view.addSubview(progressView!)
        //加载
        wkWebView.load(NSURLRequest.init(url: URL.init(string: url)!) as URLRequest)
        ///添加监听
        self.addObserverForWebView()
        //创建返回按钮和关闭按钮
        self.createCloseButtonAndBackButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    deinit {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        progressView = nil
    }
}

