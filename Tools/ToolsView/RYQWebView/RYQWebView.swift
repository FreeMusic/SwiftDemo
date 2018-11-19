//
//  RYQWebView.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/19.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit
import WebKit

class RYQWebView: WKWebView, WKUIDelegate, WKNavigationDelegate , WKScriptMessageHandler{
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    

    var progressView: UIProgressView?
    
    required init?(coder: NSCoder) {
        
        if let _view = UIView(coder: coder) {
            super.init(frame: _view.frame, configuration: WKWebViewConfiguration())
            autoresizingMask = _view.autoresizingMask
            self.translatesAutoresizingMaskIntoConstraints = false
        } else {
            return nil
        }
        uiDelegate = self
        navigationDelegate = self
        
        addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 2))
        progressView?.trackTintColor = UIColor.white
        progressView?.progressTintColor = UIColor.orange
        
        addSubview(progressView!)
        
        webViewConfiguretion()
    }
    
    func loadUrl(string: String) {
        if let url = URL(string: string) {
            load(URLRequest(url: url))
        }
    }
    
    func webViewConfiguretion() {
        
        let preferences = WKPreferences()
        configuration.preferences = preferences
        
        //        preferences.minimumFontSize = 15
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        
    }
    
    func loadFile(_ file: String) {
        let path = Bundle.main.path(forResource: file, ofType: "html")
        let fileURL = URL(fileURLWithPath: path!)
        
        if #available(iOS 9.0, *) {
            loadFileURL(fileURL, allowingReadAccessTo: fileURL)
        } else {
            load(URLRequest(url: fileURL))
        }
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView?.isHidden = estimatedProgress == 1
            
            progressView?.setProgress(Float(estimatedProgress), animated: true)
            
            if(estimatedProgress >= 1.0) {
                progressView?.progress = 0
            }
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    deinit {
        removeObserver(self, forKeyPath: "estimatedProgress")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        progressView = nil
    }

}
