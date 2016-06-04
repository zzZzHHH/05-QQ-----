//
//  QQMusicDataTool.swift
//  QQ音乐
//
//  Created by xmg on 16/6/4.
//  Copyright © 2016年 xmg. All rights reserved.
//

import UIKit

class QQMusicDataTool: NSObject {

    
    class func getMusicMs(result: (musicMs: [QQMusicModel]?)->())
    {
    
        // 发送一个网络请求, 获取
        // 异步,
     
        
        // 解析数据
        // 1. 加载plist
        guard let path = NSBundle.mainBundle().pathForResource("Musics.plist", ofType: nil) else {
            result(musicMs: nil)
            return
        }
        
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result(musicMs: nil)
            return
        }
        
        
        // 2. 遍历字典
        var tempMusicMs = [QQMusicModel]()
        for dic in dicArray {
            // 3. 字典转模型
            let model = QQMusicModel(dic: dic as! [String : AnyObject])
            tempMusicMs.append(model)
        }

        // 4. 返回结果
        result(musicMs: tempMusicMs)
        
        
    }
    
    
}
