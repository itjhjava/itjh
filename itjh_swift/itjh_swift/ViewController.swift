//
//  ViewController.swift
//  itjh_swift
//
//  Created by LijunSong on 14/8/12.
//  Copyright (c) 2014年 itjh. All rights reserved.
//
import Foundation
import UIKit
import QuartzCore
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, HttpProtocol{
    
    
    @IBOutlet var tv: UITableView!
    
    let mycell: String = "MyCell"
    
    var _prototypeCell: MyCell?
    var prototypeCell: MyCell {
        get {
            if _prototypeCell == nil {
                _prototypeCell = tv?.dequeueReusableCellWithIdentifier(mycell) as? MyCell
            }
            return _prototypeCell!
        }
    }
    
    
    var dataArray = NSMutableArray()
    var eHttp:HttpController = HttpController()
    
    //数据源
    var tableData:JSONValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var viewController = self
        var nib = UINib(nibName: mycell, bundle: nil)
        tv?.registerNib(nib, forCellReuseIdentifier: mycell)
        
        self.title="编程感悟"
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self,
            selector: "didRecieveResults:",
            name:UIContentSizeCategoryDidChangeNotification,
            object: nil)
        eHttp.delegate = self
        eHttp.onGetArticles("http://203.195.161.238:8080/itjh_mobileServer/ArticlesServer/getArticlesByProgrammingInsights/0/10")
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        
        return (tableData?.array?.count)!
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        //        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        //
        //        cell.textLabel.text = tableData?[indexPath.row]["title"].string
        //
        //        cell.detailTextLabel.text = tableData?[indexPath.row]["author"].string
        //
        //         var cell = tableView?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? MyCell
        
        var cell:MyCell = tableView.dequeueReusableCellWithIdentifier(mycell) as MyCell
        var title = tableData?[indexPath.row]["title"].string
        var postDate:NSString = (tableData?[indexPath.row]["postDate"].string)!
        cell.loadItem(title!,postdate:postDate.substringWithRange(NSRange(location: 0,length: 10)))
        
        return cell;
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
        
        var articlesInfo:ArticlesInfoController = self.storyboard.instantiateViewControllerWithIdentifier("articlesInfo") as ArticlesInfoController
        
        articlesInfo.title = (tableData?[indexPath.row]["title"].string)!
        
        let artId = (tableData?[indexPath.row]["id"].string)!
        
        let urlStr:String="http://203.195.161.238:8080/itjh_mobileServer/ArticlesServer/getArticlesByArtticsId/\((artId as NSString).intValue)"
        
        println(urlStr)
        
        var url: NSURL = NSURL(string: urlStr)
        var data=NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)
        
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        articlesInfo.artContentStr = json.objectForKey("content") as NSString
        
        self.navigationController.pushViewController(articlesInfo,animated:true)
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        
        return 68.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRecieveResults(results: JSONValue) {
        
        println(results)
        
        self.tableData = results
        self.tv?.reloadData()
        
        
    }
    
    
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!){
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            
        })
        
    }
    
    
    
}

