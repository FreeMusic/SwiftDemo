//
//  Factory.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/16.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class Factory: NSObject {
    
    /**
     json转字典
     */
    class func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    /**
     json转数组
     */
    class func getArrayFromJSONString(jsonString:String) ->NSArray{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return array as! NSArray
        
    }
    
    class func createTextFieldWith(Frame frame:CGRect, BoardStyle boardStyle:UITextBorderStyle, PlaceHolder placeHolder:String?, BackgroundColor backgroundColor:UIColor?, TintColor tintColor:UIColor?, IsPWD isPwd:Bool) -> UITextField{
        let textField = UITextField(frame: frame)
        textField.borderStyle = boardStyle
        if placeHolder != nil {
            textField.placeholder = placeHolder
        }
        if backgroundColor != nil {
            textField.backgroundColor = backgroundColor
        }
        if tintColor != nil {
            textField.tintColor = tintColor
        }
        textField.clearButtonMode = .always
        if isPwd {
            textField.isSecureTextEntry = true
        }
        return textField
    }
    
    class func createImageViewWith(Frame frame:CGRect, ImageName imageName:String, CornarRadius radius:Float) -> UIImageView{
        let imageView = UIImageView(frame:frame)
        imageView.image = UIImage(named:imageName)
        imageView.layer.cornerRadius = CGFloat(radius)
        return imageView
    }
    
    class func createViewWith(Frame frame:CGRect, BackgroundColor backgroundColor:UIColor?) -> UIView{
        let view = UIView(frame:frame)
        if backgroundColor != nil {
            view.backgroundColor = backgroundColor
        }
        return view
    }
    
    class func GET_USER_DEFAULTS(Key key:String) -> Any?{
        return UserDefaults.standard.value(forKey:key) ?? ""
    }
    /**
     base64加密
     */
    class func encodingBase64(String str:String) -> String{
        let data = str.data(using: String.Encoding.utf8)
        return (data?.base64EncodedString(options: .lineLength64Characters))!
    }
    /**
     将当前时间转换成毫秒时间
     */
    class func changeNowDateToTimeStamp() -> Int{
        return Int(Date().timeIntervalSince1970)
    }
    
    //由颜色生成图片
    class func createImageFrom(Color color:UIColor) -> UIImage{
        let rect = CGRect(x:0, y:0, width:1, height:1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    /**
     判断手机号码合法性
     */
    class func isValid(MobilePhone phone:String) -> Bool {
        if phone.count != 11 {
            return false
        }
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if regextestcm.evaluate(with: phone) || regextestct.evaluate(with: phone) || regextestcu.evaluate(with: phone){
            return true
        }else{
            return false
        }
    }
    /**
     判断字符串条件 1:数字 2:英文 3:符合的英文+数字
     */
    class func isHaveNumAndLetter(String string:String) -> Int {
        do {
            let tNumRegularExpression =  try NSRegularExpression.init(pattern: "[0-9]", options: .caseInsensitive)
            let tNumMatchCount:Int = tNumRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            let tLetterRegularExpression = try NSRegularExpression.init(pattern: "[A-Za-z]", options: .caseInsensitive)
            let tLetterMatchCount:Int = tLetterRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            if tNumMatchCount == string.count {
                return 1
            }else if tLetterMatchCount == string.count {
                return 2
            }else if tNumMatchCount + tLetterMatchCount == string.count {
                return 3
            }else{
                return 4
            }
        }catch{return 0}
    }

    /**
     判断字符串是否存在
     */
    class func isBlankString(String string:String?) -> String{
        if nil == string{
            return ""
        }
        
        return string!
    }

}
