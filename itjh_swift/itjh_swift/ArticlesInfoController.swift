//
//  ArticlesInfoController.swift
//  itjh_swift
//
//  Created by LijunSong on 14/8/12.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit

class ArticlesInfoController: UIViewController {

    
 
    @IBOutlet weak var artContent: UITextView!
    
    var artContentStr:String = ""
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        artContent?.text = artContentStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
