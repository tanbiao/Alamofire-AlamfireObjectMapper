//
//  HttpMapper.swift
//  ObejectMapper
//
//  Created by 西厢流水 on 17/10/16.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit
import ObjectMapper

enum Result<T>
{
    case Success(T)
    
    case Failure(msg :String)
    
    case HttpError(error:String)
    
}

class Group: Mappable
{
    var customer_num : Int?
    var price : Float?;

    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        customer_num <- map["customer_num"]
        price <- map["price"]
    }
    
}

class Goods: Mappable
{
    var cnt : String = ""
    var country : String = "";
    var event_type :Int = -1;
    var goods_id : String = "";
    var goods_name :String = ""
    var group : Group?
    var hd_thumb_url : String = ""
    var market_price : String  = ""
    var short_name : String = ""
    var tag : Int = -1
    var thumb_url : String = ""
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        cnt <- map["cnt"]
        country <- map["country"]
        event_type <- map["event_type"]
        goods_id <- map["goods_id"]
        goods_name <- map["goods_name"]
        group <- map["group"]
        hd_thumb_url <- map["hd_thumb_url"]
        market_price <- map["market_price"]
        tag <- map["tag"]
        thumb_url <- map["thumb_url"]
    }
    
}

class Gift: Mappable
{
    var goods_list: [Goods]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        goods_list <- map["goods_list"]
    }
    
    
}








