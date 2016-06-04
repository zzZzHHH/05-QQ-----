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

    
    var musicMs: [QQMusicModel] = [QQMusicModel]() {
        didSet {
             tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 负责界面设置
        setUpView()
        
        // 负责加载数据
        QQMusicDataTool.getMusicMs { (musicMs) in
            
            // 展示数据
            print(musicMs)
            if musicMs != nil {
                self.musicMs = musicMs!
            }
    
        }
    }

   
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
    
    // tableview
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




