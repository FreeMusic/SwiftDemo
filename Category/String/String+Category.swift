//
//  String+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/9.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation

extension String {
    /**
     * 查询lable高度
     * @param fontSize, 字体大小
     * @param width, lable宽度
     */
    func getLableHeightByWidth(_ fontSize: CGFloat,
                               width: CGFloat,
                               font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        let attributes = [NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.height
    }
}
