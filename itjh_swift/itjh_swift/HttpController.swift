//
//  HttpController.swift
//  itjh_ios
//
//  Created by LijunSong on 14/8/9.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit
protocol HttpProtocol{
    func didRecieveResults(results:JSONValue)
}

class HttpController:NSObject{
    
    var delegate:HttpProtocol?
    
    //获取文章列表
    func onGetArticles(url:String){
        
        var url: NSURL = NSURL(string: url)
        var data=NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)
//        //解析文章json
      
        let articlesJson = JSONValue(data)
        
        //println(articlesJson)
        
        //var nsUrl:NSURL=NSURL(string:url)
        // request:NSURLRequest = NSURLRequest(URL: nsUrl)
        
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
//            (response:NSURLResponse!,data:NSData!,error:NSError!)->Void in
        
//            var jsonResult:NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
//            
//            self.delegate?.didRecieveResults(jsonResult)
        
//      })
        
//        var nsUrl:NSURL=NSURL(string:url)
//        var request:NSURLRequest = NSURLRequest(URL: url)
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
//            (response:NSURLResponse!,data:NSData!,error:NSError!)->Void in
//            
//            var jsonResult:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//            
//            
//            
//        })
        self.delegate?.didRecieveResults(articlesJson)
    }

}
