//
//  BaseService.swift
//  eyes
//
//  Created by yangyouyong on 15/8/7.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit
import Alamofire

struct BaseAPI {
    let host:String = "http://baobab.wandoujia.com"
    let videoListUrl: String = "/api/v1/feed?num=10&date=20150807&vc=67"
}

class BaseService: NSObject {
    
    func GET(requestUrl url: String, completionHandler: (models:[VideoModel]?, NSError?) -> Void){
        Alamofire.request(.GET, URLString: url).response {
            (_, _, data, error) in
            if data != nil {
                if (JSON(data: data as! NSData) != nil){
                    let json = JSON(data: data as! NSData)
                    // 二次解析
                    let items = json["dailyList"][0]["videoList"]
                    var modelArray = [VideoModel]()
                    for value in items{
                        let (_ , dict) = value as (String,JSON)
                        let videoModel = VideoModel().objectWithKeyValues(dict.object as! [String : AnyObject])
                        modelArray.append(videoModel)
                        print(videoModel.descrip)
                    }
                    
                    if modelArray.count >= 0 {
                        completionHandler(models: modelArray, nil)
                    }
                }
            }else{
//                print("noData,\(error)")
                completionHandler(models: nil, error)
            }
            
        }
    }

}
