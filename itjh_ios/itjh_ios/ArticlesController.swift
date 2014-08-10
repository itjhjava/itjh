//
//  ArticlesController.swift
//  itjh_ios
//
//  Created by LijunSong on 14/8/9.
//  Copyright (c) 2014年 itjh. All rights reserved.
//
/**
获取文章列表
*/

import UIKit

import QuartzCore

class ArticlesController: UIViewController, UITableViewDataSource, UITableViewDelegate, HttpProtocol{
    
    
    
    
    
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

//        cell.title_.text = tableData?[indexPath.row]["title"].string
//        cell.zz.text = tableData?[indexPath.row]["author"].string
//        cell.date.text = tableData?[indexPath.row]["postDate"].string
//        
//        let indentifier:String = "mycell"
//        //注册自定义cell到tableview中，并设置cell标识符为indentifier（nibName对应UItableviewcell xib的名字）
//        var nib:UINib = UINib(nibName:"MyCell2", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: indentifier)
//        //从tableview中获取标识符为papercell的cell
//        var cell:MyCell2 = tableView.dequeueReusableCellWithIdentifier(indentifier) as MyCell2
//        //cell.title2.text="sssssss"
//        cell.date.text="1991"
        
//        cell.title_.text = tableData?[indexPath.row]["title"].string
//        cell.zz.text = tableData?[indexPath.row]["author"].string
//        cell.data.text = tableData?[indexPath.row]["postDate"].string
////        cell.ee.text = "dddd"
//        let cellIdentifier: String = "MyCell2"
//        // may be no value, so use optional
//        var cell: MyCell2? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MyCell2
//        
//        if cell == nil { // no value
//            cell = MyCell2(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
//        }
//        
//        cell?.date.text=tableData?[indexPath.row]["title"].string
        return cell
    }
    
    /**
        点击选择
    */
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
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
