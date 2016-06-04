//
//  QQMusicCell.swift
//  QQ音乐
//
//  Created by xmg on 16/6/4.
//  Copyright © 2016年 xmg. All rights reserved.
//

import UIKit

enum QQMusicCellAnimationType: Int {
    case Rotation
    case Scale
}


class QQMusicCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var musciNameLabel: UILabel!
    
    @IBOutlet weak var singerNameLabel: UILabel!
    
    
    
    var musicM: QQMusicModel? {
        didSet {
            if musicM?.icon != nil {
                 iconImageView.image = UIImage(named: (musicM?.icon)!)
            }

            musciNameLabel.text = musicM?.name
            singerNameLabel.text = musicM?.singer
            
        }
    }
    
    
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
    
    
    
    
    
    
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
