//
//  NetworkTools.swift
//  ObejectMapper
//
//  Created by 谭彪 on 2017/10/16.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper

let networkMsg = "发送请求错误"

class NetworkTools
{
    func imageList(parameters : [String : Any],completionHandler:@escaping((Result<Gift>) -> Void)){
        
        Alamofire.request(URLRouter.imageList(parameter: parameters)).responseObject { (response: DataResponse<Gift>) in
            
            switch response.result
            {
                case .success(let value):
            
                completionHandler(Result.Success(value))
            
                case .failure(let error):
            
                completionHandler(Result.HttpError(error: error.localizedDescription))
            }

        }
    }
}
