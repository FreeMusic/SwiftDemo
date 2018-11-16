//
//  RYQWebViewVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/12.
//  Copyright © 2018年 橘子Star. All rights reserved.
//
//(1)loadRequest()  加载请求
//(2)goBack()  网页后退
//(3)goForward()  网页前进
//(4)reload()  网页重新加载
//(5)stopLoading()  网页停止加载
//(6)title  网页标题
//(7)canGoBack  网页是否能够后退
//(8)canGoForward  网页是否能够前进
//(9)estimatedProgress  网页加载中当前的进度


import UIKit
import WebKit

class RYQWebViewVC: BaseViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {
    
    var url:String = ""//链接
    var wkWebView = WKWebView()//网页

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "新闻资讯"
        wkWebView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavigationBarHeight)
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
        self.view.addSubview(wkWebView)
        wkWebView.load(NSURLRequest.init(url: URL.init(string: url)!) as URLRequest)
        ///添加监听
        self.addObserverForWebView()
        //创建返回按钮和关闭按钮
        self.createCloseButtonAndBackButton()
    }
    /**
     添加监听
     */
    func addObserverForWebView(){
        //添加监听
        self.wkWebView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
    }
    /**
     创建返回按钮和关闭按钮
     */
    func createCloseButtonAndBackButton(){
        //返回按钮
        let backButton = RYQButton().initButton(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44), image: "backBlackIcon", action: #selector(backButtonClick), target: self)
        let backButtonItem = UIBarButtonItem.init(customView: backButton)
        //关闭按钮
        let closeButton = RYQButton.init().initTextButton(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44), title: "关闭", action: #selector(closeButtonClick), target: self, font: 28, style: RYQButton.TitleLabelFontStyle.system, backColor: RYQButton.ButtonBackGColor.clear)
        let closeButtonItem =  UIBarButtonItem.init(customView: closeButton)
        
        self.navigationController?.navigationItem.leftBarButtonItems = [backButtonItem, closeButtonItem]
    }
    
    func backButtonClick(){
        if self.wkWebView.canGoBack {
            self.wkWebView.goBack()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func closeButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            self.title = self.wkWebView.title;
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
}
