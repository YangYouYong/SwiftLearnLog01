//
//  VideoPlayerViewController.swift
//  eyes
//
//  Created by yangyouyong on 15/8/14.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class VideoPlayerViewController: AVPlayerViewController {
    var model: VideoModel?
//    var playerController: AVPlayerViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player = AVPlayer(URL: NSURL(string: (model?.playUrl)!)!)
        self.player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
