//
//  ViewController.swift
//  itjh_ios
//
//  Created by LijunSong on 14/8/9.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HttpProtocol {
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    var eHttp:HttpController = HttpController()
    
    //数据源
    var tableData:JSONValue?
    
    
    /**
    
    */
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        
        let count = tableData?.array?.count
        
        return count!
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "bcgw")
        //
        cell.textLabel.text = tableData?[indexPath.row]["title"].string
        
        cell.detailTextLabel.text = tableData?[indexPath.row]["author"].string
        
        return cell
    }
    
    /**
    点击选择
    */
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
        
        var articlesId = tableData?[indexPath.row]
        
        var articlesinfo:ArticlesInfoController = self.storyboard.instantiateViewControllerWithIdentifier("articlesinfo") as ArticlesInfoController
        articlesinfo.capitalString = "sss"
        
        self.navigationController.pushViewController(articlesinfo,animated:true)

        println(articlesId)
        println("你点击了我")
    }
    
    
    func didRecieveResults(results: JSONValue) {
        
        println(results)
        
        self.tableData = results
        self.tv?.reloadData()
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eHttp.delegate = self
        eHttp.onGetArticles("http://203.195.161.238:8080/itjh_mobileServer/ArticlesServer/getArticlesByProgrammingInsights")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!){
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            
        })
        
    }
    
    
}

