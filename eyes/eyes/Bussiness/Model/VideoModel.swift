//
//  videoModel.swift
//  eyes
//
//  Created by yangyouyong on 15/8/7.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit

/*
{
id: 1996,
date: 1438876800000,
idx: 1,
title: "无人机大战",
description: "廉价无人机厂商 Parrot 是全球消费类无人机市场的早期领先者之一，相较于大疆那些专业的飞行器， Parrot 的选择更多、可玩性更强以及更便宜。买一堆飞行器在家里展开一场无人机大战吧！From devinsupertramp",
category: "综合",
provider: {
name: "YouTube",
alias: "youtube",
icon: "http://img.wdjimg.com/image/video/fa20228bc5b921e837156923a58713f6_256_256.png"
},
duration: 164,
coverForFeed: "http://img.wdjimg.com/image/video/c3b3d01a203624f654ee5b76b70b87cb_0_0.jpeg",
coverForDetail: "http://img.wdjimg.com/image/video/c3b3d01a203624f654ee5b76b70b87cb_0_0.jpeg",
coverBlurred: "http://img.wdjimg.com/image/video/65f059e8c1ccb0b3c893d3e5432b85ce_0_0.jpeg",
coverForSharing: "http://img.wdjimg.com/image/video/c3b3d01a203624f654ee5b76b70b87cb_0_0.jpeg",
playUrl: "http://baobab.cdn.wandoujia.com/14386893679355.mp4",
playInfo: [
{
name: "标清",
type: "normal",
url: "http://baobab.cdn.wandoujia.com/1438693345124_1996_720x480.mp4"
},
{
name: "高清",
type: "high",
url: "http://baobab.cdn.wandoujia.com/14386893679355.mp4"
}
],
webUrl: "http://wandou.im/lln3w",
rawWebUrl: "http://www.wandoujia.com/eyepetizer/detail.html?vid=1996",
consumption: {
collectionCount: 58,
shareCount: 170,
playCount: 0
}
}
*/

class VideoProvider {
    var name: String?
    var alias: String?
    var icon: String?
}

class VideoPlayInfo {
    var name: String?
    var type: String?
    var url: String?
}

class VideoConsumption {
    var collectionCount: NSNumber?
    var shareCount: NSNumber?
    var playCount: NSNumber?
}

class VideoModel: NSObject {
    var videoID:NSNumber?
    var date: NSNumber?
    var idx: NSNumber?
    var title: String?
    var descrip: String?
    var category: String?
    var provider: VideoProvider?
    var duration: NSNumber?
    var coverForFeed: String?
    var coverForDetail: String?
    var coverForBlurred: String?
    var coverForSharing: String?
    var playUrl: String?
    var playInfo:[VideoPlayInfo]?
    var webUrl: String?
    var rawWebUrl: String?
    
    func objectWithKeyValues(dict:[String : AnyObject]) -> Self{
        self.videoID = dict["id"] as? NSNumber
        self.date = dict["date"] as? NSNumber
        self.idx = dict["idx"] as? NSNumber
        self.descrip = dict["description"] as? String
        self.coverForDetail = dict["coverForDetail"] as? String
        self.title = dict["title"] as? String
        self.playUrl = dict["playUrl"] as? String
        return self
    }

}
