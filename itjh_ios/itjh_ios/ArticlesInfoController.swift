//
//  ArticlesInfoController.swift
//  itjh_ios
//
//  Created by LijunSong on 14/8/12.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit

class ArticlesInfoController: UIViewController {

    @IBOutlet
    var capitalLabel: UILabel?
    
    var capitalString: String = "";
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        capitalLabel?.text = capitalString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    


}
