//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "spin1", durationLbl: 4, videoTitle: "侧上旋球", videoDescription: "正手如何发出又奔又快的侧上旋球", intensity: "中等", videoID: "twwOgEVTgjU", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 250, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "发奔球"),
            TrainActionModel(youtubeTime: 490, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "正手发侧上旋")
            ]),
        TrainListModel(videoImg: "spin2", durationLbl: 7, videoTitle: "下旋发球", videoDescription: "如何迷惑对手，让他不知所措", intensity: "入门", videoID: "Ldko5dlZTiE", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 27, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "训练1"),
            TrainActionModel(youtubeTime: 70, stopTime: 23, restTime: 3, timesDescription: 60, actionDescription: "训练2"),
            TrainActionModel(youtubeTime: 131, stopTime: 56, restTime: 3, timesDescription: 120, actionDescription: "训练3"),
            TrainActionModel(youtubeTime: 198, stopTime: 90, restTime: 3, timesDescription: 180, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "spin3", durationLbl: 5, videoTitle: "反手台內擰", videoDescription: "让你学会超酷旋球回击", intensity: "入门", videoID: "qH4ayjFwhPg", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 22, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "训练1"),
            TrainActionModel(youtubeTime: 72, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "训练2"),
            TrainActionModel(youtubeTime: 122, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "定点回击"),
            TrainActionModel(youtubeTime: 237, stopTime: 110, restTime: 3, timesDescription: 120, actionDescription: "发力技巧")
            ]),
        TrainListModel(videoImg: "cut1", durationLbl: 1, videoTitle: "正手削球", videoDescription: "Table Tennis forehand chopping training", intensity: "入门", videoID: "7mNDrEVm72E", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 65, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "正手削球")
            ]),
        TrainListModel(videoImg: "cut2", durationLbl: 3, videoTitle: "反手削球", videoDescription: "Table Tennis backhand chopping training", intensity: "入门", videoID: "_qTcXTSZggo", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "反手削球")
            ]),
        TrainListModel(videoImg: "cut3", durationLbl: 3, videoTitle: "削球回击", videoDescription: "几分钟学会将超转的下旋球拉起来", intensity: "中等", videoID: "F1ud1uwC6YU", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 74, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "动作练习1"),
            TrainActionModel(youtubeTime: 395, stopTime: 40, restTime: 3, timesDescription: 120, actionDescription: "动作练习2")
            ]),
        TrainListModel(videoImg: "smash1", durationLbl: 4, videoTitle: "扣杀", videoDescription: "提高扣杀的上台率和威胁", intensity: "入门", videoID: "FpjwcM5Mc5Q", category: .smash, actionModel: [
            TrainActionModel(youtubeTime: 224, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "提升扣杀率"),
            TrainActionModel(youtubeTime: 346, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "放短也行"),
            TrainActionModel(youtubeTime: 590, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "利用反弹回击")
            ]),
        TrainListModel(videoImg: "smash2", durationLbl: 3, videoTitle: "反手扣杀", videoDescription: "Table Tennis backhand smash training", intensity: "入门", videoID: "gB7iP0BXgNo", category: .smash, actionModel: [
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习1"),
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习2"),
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习3")
            ])
    ]
    
    private let spinArray = [
        TrainListModel(videoImg: "spin1", durationLbl: 4, videoTitle: "侧上旋球", videoDescription: "正手如何发出又奔又快的侧上旋球", intensity: "中等", videoID: "twwOgEVTgjU", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 250, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "发奔球"),
            TrainActionModel(youtubeTime: 490, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "正手发侧上旋")
            ]),
        TrainListModel(videoImg: "spin2", durationLbl: 7, videoTitle: "下旋发球", videoDescription: "如何迷惑对手，让他不知所措", intensity: "入门", videoID: "Ldko5dlZTiE", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 27, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "训练1"),
            TrainActionModel(youtubeTime: 70, stopTime: 23, restTime: 3, timesDescription: 60, actionDescription: "训练2"),
            TrainActionModel(youtubeTime: 131, stopTime: 56, restTime: 3, timesDescription: 120, actionDescription: "训练3"),
            TrainActionModel(youtubeTime: 198, stopTime: 90, restTime: 3, timesDescription: 180, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "spin3", durationLbl: 5, videoTitle: "反手台內擰", videoDescription: "让你学会超酷旋球回击", intensity: "入门", videoID: "qH4ayjFwhPg", category: .spin, actionModel: [
            TrainActionModel(youtubeTime: 22, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "训练1"),
            TrainActionModel(youtubeTime: 72, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "训练2"),
            TrainActionModel(youtubeTime: 122, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "定点回击"),
            TrainActionModel(youtubeTime: 237, stopTime: 110, restTime: 3, timesDescription: 120, actionDescription: "发力技巧")
            ])
    ]
    
    private let cutArray = [
        TrainListModel(videoImg: "cut1", durationLbl: 1, videoTitle: "正手削球", videoDescription: "Table Tennis forehand chopping training", intensity: "入门", videoID: "7mNDrEVm72E", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 65, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "正手削球")
            ]),
        TrainListModel(videoImg: "cut2", durationLbl: 3, videoTitle: "反手削球", videoDescription: "Table Tennis backhand chopping training", intensity: "入门", videoID: "_qTcXTSZggo", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "反手削球")
            ]),
        TrainListModel(videoImg: "cut3", durationLbl: 3, videoTitle: "削球回击", videoDescription: "几分钟学会将超转的下旋球拉起来", intensity: "中等", videoID: "F1ud1uwC6YU", category: .cut, actionModel: [
            TrainActionModel(youtubeTime: 74, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "动作练习1"),
            TrainActionModel(youtubeTime: 395, stopTime: 40, restTime: 3, timesDescription: 120, actionDescription: "动作练习2")
            ])
    ]
    
    private let smashArray = [
        TrainListModel(videoImg: "smash1", durationLbl: 4, videoTitle: "扣杀", videoDescription: "提高扣杀的上台率和威胁", intensity: "入门", videoID: "FpjwcM5Mc5Q", category: .smash, actionModel: [
            TrainActionModel(youtubeTime: 224, stopTime: 60, restTime: 3, timesDescription: 120, actionDescription: "提升扣杀率"),
            TrainActionModel(youtubeTime: 346, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "放短也行"),
            TrainActionModel(youtubeTime: 590, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "利用反弹回击")
            ]),
        TrainListModel(videoImg: "smash2", durationLbl: 3, videoTitle: "反手扣杀", videoDescription: "Table Tennis backhand smash training", intensity: "入门", videoID: "gB7iP0BXgNo", category: .smash, actionModel: [
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习1"),
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习2"),
            TrainActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 60, actionDescription: "反手扣杀练习3")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return spinArray
        case 2:
            return cutArray
        case 3:
            return smashArray
        default:
            return allArray
        }
    }
}
