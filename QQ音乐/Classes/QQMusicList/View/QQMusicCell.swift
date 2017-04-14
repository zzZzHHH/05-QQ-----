//
//  QQMusicCell.swift
//  QQ音乐
//
//  Created by xmg on 16/6/4.
//  Copyright © 2016年 xmg. All rights reserved.
//

import UIKit

// cell 内部提供的动画类型枚举
enum QQMusicCellAnimationType: Int {
    case Rotation
    case Scale
}


class QQMusicCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var musciNameLabel: UILabel!
    
    @IBOutlet weak var singerNameLabel: UILabel!
    
    
    // 接收外界传递过来的数据模型, 并监听赋值方法, 进行给子控件赋值
    var musicM: QQMusicModel? {
        didSet {
            if musicM?.icon != nil {
                 iconImageView.image = UIImage(named: (musicM?.icon)!)
            }

            musciNameLabel.text = musicM?.name
            singerNameLabel.text = musicM?.singer
            
        }
    }
    
    // 提供给外界的, 快速创建cell的方法
    class func cellWithTableView(tableView: UITableView) -> QQMusicCell {
        
        // 1. 从缓存池获取
        // 不要忘记, 在xib里面,设置, 循环利用的标识
        let cellID = "musicCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)  as? QQMusicCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("QQMusicCell", owner: nil, options: nil).first as? QQMusicCell
            
        }
        
        
        return cell!
    }
    
    
    
    // 从xib加载完毕之后
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = iconImageView.width * 0.5
        iconImageView.layer.masksToBounds = true
    }

    
    // 快速动画的方法, 写到这里, 可以是动画的重用性更高
    func animation(type: QQMusicCellAnimationType) -> () {
        
        if type == .Rotation {
            self.layer.removeAnimationForKey("rotation")
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            animation.values = [-M_PI * 0.25, 0, M_PI * 0.25, 0]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "rotation")
        }else if type == .Scale {
            self.layer.removeAnimationForKey("scale")
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            animation.values = [0.5, 1, 0.5, 1]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "scale")
        }
        
      
    }
    
    
    // 重写系统的方法, 可以覆盖掉, 系统的实现
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }

    
}
