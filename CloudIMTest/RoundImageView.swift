//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by 赵晓东 on 16/3/31.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

//开启 storyboard 实时渲染

@IBDesignable
class RoundImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
