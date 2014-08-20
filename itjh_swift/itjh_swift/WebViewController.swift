//
//  WebViewController.swift
//  itjh_swift
//
//  Created by LijunSong on 14/8/14.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    //文章ID
    var artID:NSString = ""
    
    var artURL = "http://203.195.161.238:8080/itjh_mobileServer/ArticlesServer/getArticlesByArtticsId/"
    
    var webView:UIWebView?
    
    
    func loadDataSource() {
        var urlString = artURL + artID
////        var urlString = "http://daily.zhihu.com/story/4098404"
//       var url = NSURL.URLWithString(urlString)
//        var urlRequest = NSURLRequest(URL :NSURL.URLWithString(urlString))
//
        
        var url: NSURL = NSURL(string: urlString)
                var data=NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)
        
                var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        
        
        json.objectForKey("content") as NSString
        
        let htmlTitle = json.objectForKey("title") as NSString
        
        let htmlStr = "<font size=3 style='padding:10px;'>\(htmlTitle)<br><hr></hr>"
        
     
        
        let topHtml = "<!doctype html><html lang='zh-CN'><head><meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><title>\(htmlTitle)</title><meta name='apple-itunes-app' content='app-id=639087967, app-argument=zhihudaily://story/4098404'><meta name='viewport' content='user-scalable=no, width=device-width'><link rel='stylesheet' href='http://news.at.zhihu.com/css/share.css'><script src='http://static.daily.zhihu.com/js/modernizr-2.6.2.min.js'></script><base target='_blank'></head><body style='overflow: hidden;width: 325px;'><div class='main-wrap content-wrap'><div class='headline'><div class='content-inner'><div class='question'><h2 class='question-title'>\(htmlTitle)</h2><div class='answer'><div class='content'>"
        
        
        let footHtml = "</div></div><script src='http://static.daily.zhihu.com/js/jquery.1.9.1.js'></script><script src='http://news.at.zhihu.com/js/share.js'></script></body></html>"
        
//        let sss = topHtml + (json.objectForKey("content") as NSString) + footHtml
//
//        
//        
     
        webView!.loadHTMLString(topHtml + (json.objectForKey("content") as NSString + footHtml) , baseURL: NSBundle.mainBundle().bundleURL)
        
//        webView?.loadRequest(urlRequest)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView=UIWebView()
        webView!.frame=self.view.frame
        webView!.backgroundColor=UIColor.whiteColor()
        
        
//        
//        webView?.scalesPageToFit=true
        
        self.view.addSubview(webView!)
        
        loadDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
