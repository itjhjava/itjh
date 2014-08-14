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
//        var urlString = "http://www.itjhwd.com/grwz/"
//        var url = NSURL.URLWithString(urlString)
//        var urlRequest = NSURLRequest(URL :NSURL.URLWithString(urlString))
//      
        
        var url: NSURL = NSURL(string: urlString)
                var data=NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)
        
                var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
                json.objectForKey("content") as NSString
        
        
        webView!.loadHTMLString(json.objectForKey("content") as NSString, baseURL: NSBundle.mainBundle().bundleURL)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView=UIWebView()
        webView!.frame=self.view.frame
        webView!.backgroundColor=UIColor.grayColor()
        self.view.addSubview(webView!)
        
        loadDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
