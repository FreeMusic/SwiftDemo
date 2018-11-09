//
//  HomeCell.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class HomeCell: MyTableViewCell {
    
    var nameLabel:UILabel!//姓名
    var model:HomeModel!
    var imgView: UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = self.initLabel(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 30), text: "姓名：小三")
        self.selectionStyle = UITableViewCellSelectionStyle.none

        imgView = UIImageView.init()
        self.imgView.backgroundColor = UIColor.FromRGB(hexadecimal: "#778ef2")
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(nameLabel.snp.bottom)
            make.right.equalTo(0)
        }
    }
    
    
    func initLabel(frame: CGRect, text: String) -> UILabel {
        let label = UILabel.init(color: UIColor.black, font: 15, text: text, subView: self)
        label.textAlignment = NSTextAlignment.center
        label.frame = frame
        
        return label
    }
    
    func setMyHomeModel(model: HomeModel) {
        self.nameLabel.text = model.title
        let imgURLs = model.imgUrl.components(separatedBy: ",")
        if !(imgURLs.last?.isEmpty)! {
            self.imgView.kf.setImage(with: ImageResource(downloadURL: URL.init(string: imgURLs.last!)!))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
