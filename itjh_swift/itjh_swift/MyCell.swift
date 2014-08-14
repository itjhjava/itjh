//
//  MyCell.swift
//  MyCellTest
//
//  Created by LijunSong on 14/8/13.
//  Copyright (c) 2014年 itjh. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet var artTitle: UILabel!
    
    @IBOutlet var postDate: UILabel!
    func loadItem(title: String,postdate: String) {
        artTitle?.text = title
        postDate?.text = postdate
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
    }
    
    
}
