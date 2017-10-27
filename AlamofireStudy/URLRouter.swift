//
//  URLRouter.swift
//  ObejectMapper
//
//  Created by 谭彪 on 2017/10/16.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit
import Alamofire

let baseUrl = "http://apiv2.yangkeduo.com/operation/14/"

enum URLRouter: URLRequestConvertible
{
    case imageList(parameter : Parameters)
    
    case other(parameter : Parameters )
    
    /// 请求的URL
    var path : String
    {
        switch self
        {
            case .imageList:
                
                return "groups"
                
            case .other:
                
                return "test"
        }
    
    }
    
    /// 请求的方式
    var mothod :HTTPMethod {
    
        switch self
        {
           case .imageList:
            
               return .get
        
           case .other:
            
               return .post
        }
    }
    
    
    /// 重写URLRequestConvertible 的方法
    func asURLRequest() throws -> URLRequest
    {
        var urlRequest = URLRequest(url: URL(string: baseUrl + path)!)
        //设置请求的方式
        urlRequest.httpMethod = mothod.rawValue
        //配置请求头
        //urlRequest.addHeader()
                
        //这里是把参数编码到请求中去
        switch self
        {
           case .imageList(let parameters):
            
             urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
          
            //这里只是测试
           case .other(let parameters):
            
             urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters.dealData())
        }
        
        return urlRequest
    }
 
}

extension Dictionary
{
    /// 处理数据
    ///
    /// - Returns: 处理后的数据
    func dealData() -> [String:Any]
    {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted) else
        {
            return ["data" :""]
        }
        guard let string = String.init(data: data, encoding: .utf8) else {
            
            return ["data":""]
        }
        return ["data":string]
    }
}

extension URLRequest
{
    //设置请求头
    mutating func addHeader() -> Void
    {
        self.addValue("sdfgrfef", forHTTPHeaderField: "Access_Token")
    }

}
