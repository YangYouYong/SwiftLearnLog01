//
//  TestServiceViewController.swift
//  eyes
//
//  Created by yangyouyong on 15/8/7.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit

class TestServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let videoListUrl: String = BaseAPI().host + BaseAPI().videoListUrl
        BaseService().GET(requestUrl:videoListUrl) { (models, _) -> Void in
            print(models)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
