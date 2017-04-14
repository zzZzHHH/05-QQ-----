//
//  QQMusicTool.swift
//  QQ音乐
//
//  Created by xmg on 16/6/4.
//  Copyright © 2016年 xmg. All rights reserved.
//  这个类, 只负责, 单首音乐的操作(播放, 暂停, 快进, 倍速)

import UIKit
import AVFoundation


class QQMusicTool: NSObject {

    
    // 记录着当前正在播放的播放器对象
    var player: AVAudioPlayer?
    
    
    // 根据一个歌曲名称, 开始播放一首歌曲
    func playMusic(name: String?) {
        
        // 0. 获取url
        guard let url = NSBundle.mainBundle().URLForResource(name, withExtension: nil) else {
            return
        }
        
        // 获取老的URL, 跟新的URL进行比较, 如果相同, 则继续播放, 如果不同, 则, 创建新的播放器, 继续播放
        if player?.url == url {
            
            player?.play()
            
            return
        }
        
        
        
        
        do {
            // 1. 创建一个播放器
            player = try AVAudioPlayer(contentsOfURL: url)
            // 2. 准备播放
            player?.prepareToPlay()
            // 3. 开始播放
            player?.play()

        }catch {
            print(error)
            return
        }
        
    }
    
    
    
}
