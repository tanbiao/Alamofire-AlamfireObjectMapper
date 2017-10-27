//
//  ViewController.swift
//  AlamofireStudy
//
//  Created by 谭彪 on 2017/10/24.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let param = ["opt_type":1,
                 "size":20,
                 "offset":(2 - 1) * 20]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NetworkTools().imageList(parameters: param) { (result) in
            
            switch result
            {
            case .Success( let value):
                
                for goods in value.goods_list!
                {
                    print(goods)
                    print("乡村:" + goods.country)
                    print("商品名:" + goods.goods_name)
                    print("Url :" + goods.hd_thumb_url)
                    
                    guard let group = goods.group else {
                        print("..............")
                        return
                    }
                    
                    print("group :\(String(describing: group.customer_num))")
                    print("group : \(String(describing: group.price))")
                    //
                    print("..............")
                }
                
                print("data:\(value)")
                
            case .HttpError(error: let errorMsg):
                print("错误信息:\(errorMsg)")
                
            default:
                
                break
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

