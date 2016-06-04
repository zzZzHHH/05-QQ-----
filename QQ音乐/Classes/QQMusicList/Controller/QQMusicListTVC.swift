//
//  QQMusicListTVC.swift
//  QQ音乐
//
//  Created by xmg on 16/6/4.
//  Copyright © 2016年 xmg. All rights reserved.
//

import UIKit


// 控制器, 只负责, 业务逻辑的调度, 不负责, 具体实现

class QQMusicListTVC: UITableViewController {

    // 数据源
    // 注意监听, 数据源的赋值事件, 然后在内部刷新表格, 
    // 因为这属于一个联动的方法
    // 数据源, 被修改, 你就应该主动的刷新表格, 展示最新的数据, 而不是交给外界刷新
    var musicMs: [QQMusicModel] = [QQMusicModel]() {
        didSet {
             tableView.reloadData()
        }
    }

}


// 主业务逻辑
extension QQMusicListTVC {
    
    // 保证里面的逻辑清晰, 因为一般看一个控制器, 就是看这几个生命周期方法做了什么事情
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 负责界面设置
        setUpView()
        
        // 2. 负责加载数据
        QQMusicDataTool.getMusicMs { (musicMs) in
            // 展示数据
            if musicMs != nil {
                self.musicMs = musicMs!
            }
        }
    }

    
    
}



// 展示数据
extension QQMusicListTVC {
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicMs.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = QQMusicCell.cellWithTableView(tableView)
        
        // 1. 取出数据模型
        let musicM = musicMs[indexPath.row]
        
        // 2. 给cell赋值
        cell.musicM = musicM
        
        
        return cell
    }

    
}



// 处理界面
// 这个类扩展里面,专门用来存放界面处理的, 
// 并且提供一个主入口给外界调用, 避免了外界乱调用, 造成的逻辑混乱
extension QQMusicListTVC {
    
    
    // 主入口
    func setUpView() -> () {
        setBackView()
        setUpNavBar()
        setUpTableView()
    }
    
    // 设置背景图片
    func setBackView() -> () {
        let image = UIImage(named: "QQListBack")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }
    
    // tableview 设置
    func setUpTableView() -> () {
        tableView.rowHeight = 60
        tableView.separatorStyle = .None
    }
    
    
    // 隐藏导航栏
    func setUpNavBar() -> () {
        navigationController?.navigationBarHidden = true
    }
    
    // 设置状态栏
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
 
    
}


// 动画处理
extension QQMusicListTVC {
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        print("test")
        
        
        // 1. 取出cell  
       let musicCell = cell as! QQMusicCell
        
        // 2. 做动画
       musicCell.animation(QQMusicCellAnimationType.Scale)
   
    }
    
    
    
}



