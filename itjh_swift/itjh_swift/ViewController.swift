//
//  ViewController.swift
//  itjh_swift
//
//  Created by LijunSong on 14/8/12.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, HttpProtocol {
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    var eHttp:HttpController = HttpController()
    
    //数据源
    var tableData:JSONValue?
    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
      
        return (tableData?.array?.count)!
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel.text = tableData?[indexPath.row]["title"].string
        
        cell.detailTextLabel.text = tableData?[indexPath.row]["author"].string
        
        return cell;
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
      
        var articlesInfo:ArticlesInfoController = self.storyboard.instantiateViewControllerWithIdentifier("articlesInfo") as ArticlesInfoController
        
        articlesInfo.artTitleString = (tableData?[indexPath.row]["title"].string)!
      
        
        
        self.navigationController.pushViewController(articlesInfo,animated:true)

        
        
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

