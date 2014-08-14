// Playground - noun: a place where people can play

import UIkit

let urlStr:String="http://203.195.161.238:8080/itjh_mobileServer/ArticlesServer/getArticlesByArtticsId/2010"

println(urlStr)

var url: NSURL = NSURL(string: urlStr)
var data=NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)

var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)

var content =  json.objectForKey("content")
